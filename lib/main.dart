import 'package:flutter/material.dart';
import 'routes.dart';
import 'login.dart';
import 'homepage.dart';
import 'profilepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => ProfilePage(),
        MyRoutes.loginroute: (context) => LoginPage(),
        MyRoutes.homeroute: (context) => HomePage(),
        MyRoutes.profileroute: (context) => ProfilePage(),
      },
    );
  }
}
