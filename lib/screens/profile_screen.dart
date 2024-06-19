import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'John Smith',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'john@gmail.com',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Edit Username',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                // Implement edit username functionality
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text(
                'Edit Password',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                // Implement edit password functionality
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                'Enable Notifications',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                // Implement enable notifications functionality
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'About',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                // Implement about screen navigation
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text(
                'Delete Account',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                // Implement delete account functionality
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                // Implement logout functionality
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
