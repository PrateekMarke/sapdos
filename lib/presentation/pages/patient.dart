import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sapdos/presentation/model/model.dart';
import 'package:sapdos/presentation/views/app_colour.dart';
import 'package:sapdos/presentation/views/responsive.dart';
import 'package:sapdos/presentation/widgets/information_widget.dart';


class Patient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient Screen',
      home: FutureBuilder<DoctorListResponse>(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            return DashboardScreen(data: snapshot.data!);
          }
        },
      ),
    );
  }

  Future<DoctorListResponse> _loadData() async {
    final jsonString = await rootBundle.loadString('assets/doctors_list.json');
    final jsonResponse = json.decode(jsonString);
    return DoctorListResponse.fromJson(jsonResponse);
  }
}

class DashboardScreen extends StatefulWidget {
  final DoctorListResponse data;

  DashboardScreen({required this.data});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showDoctorList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: _buildMobileLayout(),
        tablet: _buildTabletLayout(),
        desktop: _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: <Widget>[
        Header(user: widget.data.user),
        DoctorListDropdown(
          onPressed: () {
            setState(() {
              showDoctorList = !showDoctorList;
            });
          },
        ),
        showDoctorList
            ? Expanded(child: DoctorList(doctors: widget.data.doctorsList))
            : Container(),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Sidebar(),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: <Widget>[
              Header(user: widget.data.user),
              DoctorListDropdown(
                onPressed: () {
                  setState(() {
                    showDoctorList = !showDoctorList;
                  });
                },
              ),
              showDoctorList
                  ? Expanded(child: DoctorList(doctors: widget.data.doctorsList))
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Sidebar(),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: <Widget>[
              Header(user: widget.data.user),
              DoctorListDropdown(
                onPressed: () {
                  setState(() {
                    showDoctorList = !showDoctorList;
                  });
                },
              ),
              showDoctorList
                  ? Expanded(child: DoctorList(doctors: widget.data.doctorsList))
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final User user;

  Header({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.greeting,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                user.name,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.avatar),
          ),
        ],
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors;

  DoctorList({required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double itemHeight = (constraints.maxHeight - 3 * 16) / 3;
          final double itemWidth = constraints.maxWidth;

          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: itemHeight,
                width: itemWidth,
                child: DoctorCard(doctor: doctors[index]),
                
              );
            },
          );
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(doctor.doctorImage),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    doctor.doctorName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    doctor.specialization,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star_border, color: Colors.amber, size: 16),
                      SizedBox(width: 8),
                      Text(doctor.price.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorListDropdown extends StatelessWidget {
  final VoidCallback onPressed;

  DoctorListDropdown({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blueDarkColor,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Doctor's List",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
