import 'package:flutter/material.dart';


import 'package:sapdos/presentation/views/responsive.dart';
import 'package:sapdos/presentation/widgets/information_widget.dart';

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Screen',
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showDoctorList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        
        mobile: MobileDashboard(),
        tablet: TabletDashboard(),
        desktop: DesktopDashboard(),
      ),
    );
  }
}

class MobileDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      
      child: SingleChildScrollView(
        child: Container(
          height: 788,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Expanded(
          flex: 2,
          child: Header(),
        ),
              Text(
                "Today's Appointments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              AppointmentStatusCard(title: 'Pending Appointments', count: '19/40'),
              SizedBox(height: 16),
              AppointmentStatusCard(title: 'Completed Appointments', count: '21/40'),
              SizedBox(height: 16),
              DateBar(),
              AppointmentList(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabletDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Sidebar(),
        ),
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Header(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Appointments",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          AppointmentStatusCard(
                            title: 'Pending Appointments',
                            count: '19/40',
                          ),
                          SizedBox(width: 16),
                          AppointmentStatusCard(
                            title: 'Completed Appointments',
                            count: '21/40',
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      DateBar(),
                      AppointmentList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DesktopDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Sidebar(),
        ),
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Header(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Appointments",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          AppointmentStatusCard(
                            title: 'Pending Appointments',
                            count: '19/40',
                          ),
                          SizedBox(width: 16),
                          AppointmentStatusCard(
                            title: 'Completed Appointments',
                            count: '21/40',
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      DateBar(),
                      AppointmentList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

