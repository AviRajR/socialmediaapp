import 'package:flutter/material.dart';
import 'package:socialmedia_app/homepage.dart';
import 'routes.dart';

class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}

class AuthService {
  List<User> users = [
    User(email: 'user1@example.com', password: 'password1'),
    User(email: 'user2@example.com', password: 'password2'),
    // Add more users as needed
  ];

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    // Simulate a delay to mimic an asynchronous operation
    await Future.delayed(Duration(seconds: 1));

    for (User user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }

    return null; // Authentication failed
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  get authService => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.orange, Colors.yellow],
                begin: Alignment.topCenter)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome, Avi",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)),
                        ]),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade400))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'EmailId or Phone Number',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade400))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: InputBorder.none),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.orange),
                    child: ElevatedButton(
                      onPressed: () async {
                        User? user =
                            await authService.signInWithEmailAndPassword(
                          'user1@example.com',
                          'password1',
                        );

                        if (user != null) {
                          // Authentication successful, navigate to the home screen or perform other actions.
                          print('Authentication successful: ${user.email}');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage()));
                        } else {
                          // Authentication failed, show an error message or perform other actions.
                          print('Authentication failed');
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
