import 'package:flutter/material.dart';
import 'package:sapdos/presentation/views/responsive.dart';

class DoctorProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button
          },
        ),
        title: const Text('Doctor Profile', style: TextStyle(color: Colors.black)),
      ),
      body: Responsive(
        mobile: DoctorProfileMobile(),
        tablet: DoctorProfileMobile(), // For simplicity, using the same as mobile for now
        desktop: DoctorProfileDesktop(),
      ),
    );
  }
}

class DoctorProfileMobile extends StatefulWidget {
  @override
  _DoctorProfileMobileState createState() => _DoctorProfileMobileState();
}

class _DoctorProfileMobileState extends State<DoctorProfileMobile> {
  int? _selectedSlot;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/doc2.jpg'), // Add your image here
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Dentist (D.M.)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'BDS, DDS',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star_border, color: Colors.orange, size: 20),
                      Text(' 512'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('5 Years'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          ExpansionTile(
            leading: const Icon(Icons.access_time, color: Colors.white),
            backgroundColor: const Color(0xFF283593),
            collapsedBackgroundColor: const Color(0xFF283593),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            title: const Text(
              'Available Slots',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: List.generate(6, (index) {
                    return RadioListTile<int>(
                      value: index,
                      groupValue: _selectedSlot,
                      title: const Text('10:00 - 10:15 AM'),
                      onChanged: (value) {
                        setState(() {
                          _selectedSlot = value;
                        });
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle book appointment
              },
              child: const Text('Book Appointment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF283593), // Button color
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorProfileDesktop extends StatefulWidget {
  @override
  _DoctorProfileDesktopState createState() => _DoctorProfileDesktopState();
}

class _DoctorProfileDesktopState extends State<DoctorProfileDesktop> {
  int? _selectedSlot;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/doc2.jpg'), // Add your image here
              ),
              SizedBox(width: 32),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Dr. Lorem Ipsum',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dentist (D.M.)',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'BDS, DDS',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 24),
                        Icon(Icons.star, color: Colors.orange, size: 24),
                        Icon(Icons.star, color: Colors.orange, size: 24),
                        Icon(Icons.star, color: Colors.orange, size: 24),
                        Icon(Icons.star_border, color: Colors.orange, size: 24),
                        Text(' 512', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('5 Years', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ExpansionTile(
            leading: const Icon(Icons.access_time, color: Colors.white),
            backgroundColor: const Color(0xFF283593),
            collapsedBackgroundColor: const Color(0xFF283593),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            title: const Text(
              'Available Slots',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: <Widget>[
              Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(6, (index) {
                      return RadioListTile<int>(
                        value: index,
                        groupValue: _selectedSlot,
                        title: const Text('10:00 - 10:15 AM'),
                        onChanged: (value) {
                          setState(() {
                            _selectedSlot = value;
                          });
                        },
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle book appointment
              },
              child: const Text('Book Appointment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF283593), // Button color
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DoctorProfilePage(),
  ));
}
