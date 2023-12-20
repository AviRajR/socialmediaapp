import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/profilephoto.png'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Avirajsinh Raj',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('avirajsinhraj.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+91 1234567890'),
            ),
          ],
        ),
      ),
    );
  }
}
