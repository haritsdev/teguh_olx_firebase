import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teguh_olx/screens/location_screen.dart';
import 'package:teguh_olx/widgets/Auth.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-screen';
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is current ly signout');
      } else {
        Navigator.pushReplacementNamed(context, LocationScreen.id);
      }
    });
    return Scaffold(
        backgroundColor: Colors.green[400],
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                      height: 200,
                    ),
                    Text(
                      'Buy Or sell',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[500]),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: AuthWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'If you continue you are accpting \nTerms and conditions and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }
}
