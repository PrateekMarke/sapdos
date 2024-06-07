import 'package:flutter/material.dart';
import 'package:sapdos/presentation/views/app_colour.dart';
import 'package:sapdos/presentation/views/app_styles.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                'Dr. Amol',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/doc2.jpg'),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blueDarkColor,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: ' SAPDOS',
                  style: abrilFatface.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.whiteColor,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          SidebarItem(icon: Icons.category, text: 'Categories'),
          SidebarItem(icon: Icons.calendar_today, text: 'Appointment'),
          SidebarItem(icon: Icons.chat, text: 'Chat'),
          SidebarItem(icon: Icons.settings, text: 'Settings'),
          SidebarItem(icon: Icons.logout, text: 'Logout'),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String text;

  SidebarItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.white),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentStatusCard extends StatelessWidget {
  final String title;
  final String count;

  AppointmentStatusCard({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              count,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class DateBar extends StatelessWidget {
  const DateBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Wednesday, March 7",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class AppointmentList extends StatelessWidget {
  const AppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppointmentCard(
          time: '10:00 AM',
          patientName: 'Patient Name',
          age: 'X years',
          statusIcon: Icons.schedule,
          statusColor: Colors.red,
        ),
        AppointmentCard(
          time: '10:15 AM',
          patientName: 'Patient Name',
          age: 'X years',
          statusIcon: Icons.check_circle,
          statusColor: Colors.green,
        ),
        AppointmentCard(
          time: '10:30 AM',
          patientName: 'Patient Name',
          age: 'X years',
          statusIcon: Icons.schedule,
          statusColor: Colors.red,
        ),
        AppointmentCard(
          time: '10:45 AM',
          patientName: 'Patient Name',
          age: 'X years',
          statusIcon: Icons.check_circle,
          statusColor: Colors.green,
        ),
      ],
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String time;
  final String patientName;
  final String age;
  final IconData statusIcon;
  final Color statusColor;

  AppointmentCard({
    super.key,
    required this.time,
    required this.patientName,
    required this.age,
    required this.statusIcon,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(statusIcon, color: statusColor),
            SizedBox(width: 16),
            Text(
              time,
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            Text(
              patientName,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 16),
            Text(
              age,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
