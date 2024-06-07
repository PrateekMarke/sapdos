import 'package:flutter/material.dart';
import 'package:sapdos/presentation/views/responsive.dart';
class PatientProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button
          },
        ),
        title: Text('Patient Profile', style: TextStyle(color: Colors.black)),
      ),
      body: Responsive(
        mobile: PatientProfileMobile(),
        tablet: PatientProfileMobile(), // For simplicity, using the same as mobile for now
        desktop: PatientProfileDesktop(),
      ),
    );
  }
}

class PatientProfileMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
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
                    'Patient Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Patient age',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Issue description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 24),
          ExpansionTile(
            leading: Icon(Icons.history, color: Colors.white),
            backgroundColor: Color(0xFF283593),
            collapsedBackgroundColor: Color(0xFF283593),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            title: Text(
              'Patient History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: <Widget>[
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text('Blood report'),
                  trailing: Icon(Icons.visibility),
                  onTap: () {
                    // Handle view blood report
                  },
                ),
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text('CT Scan report'),
                  trailing: Icon(Icons.visibility),
                  onTap: () {
                    // Handle view CT scan report
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ExpansionTile(
            leading: Icon(Icons.description, color: Colors.white),
            backgroundColor: Color(0xFF283593),
            collapsedBackgroundColor: Color(0xFF283593),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            title: Text(
              'Prescription',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: <Widget>[
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text('26 March 2022'),
                  trailing: Icon(Icons.visibility),
                  onTap: () {
                    // Handle view prescription
                  },
                ),
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text('13 April 2022'),
                  trailing: Icon(Icons.visibility),
                  onTap: () {
                    // Handle view prescription
                  },
                ),
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    'Add new',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  trailing: Icon(Icons.add),
                  onTap: () {
                    // Handle add new prescription
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PatientProfileDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/doc2.jpg'), // Add your image here
          ),
          SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Patient Name',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Patient age',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Issue description',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 24),
                ExpansionTile(
                  leading: Icon(Icons.history, color: Colors.white),
                  backgroundColor: Color(0xFF283593),
                  collapsedBackgroundColor: Color(0xFF283593),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    'Patient History',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('Blood report'),
                        trailing: Icon(Icons.visibility),
                        onTap: () {
                          // Handle view blood report
                        },
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('CT Scan report'),
                        trailing: Icon(Icons.visibility),
                        onTap: () {
                          // Handle view CT scan report
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ExpansionTile(
                  leading: Icon(Icons.description, color: Colors.white),
                  backgroundColor: Color(0xFF283593),
                  collapsedBackgroundColor: Color(0xFF283593),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    'Prescription',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('26 March 2022'),
                        trailing: Icon(Icons.visibility),
                        onTap: () {
                          // Handle view prescription
                        },
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('13 April 2022'),
                        trailing: Icon(Icons.visibility),
                        onTap: () {
                          // Handle view prescription
                        },
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          'Add new',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        trailing: Icon(Icons.add),
                        onTap: () {
                          // Handle add new prescription
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PatientProfilePage(),
  ));
}
