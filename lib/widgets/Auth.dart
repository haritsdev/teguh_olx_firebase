import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 220,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_android_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Continue with Phone',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
          ),
          // with custom text
          SignInButton(
            Buttons.Google,
            text: "Continue with Google",
            onPressed: () {},
          ),
          // with custom text
          SignInButton(
            Buttons.Facebook,
            text: "Continue With Facebook",
            onPressed: () {},
          ),
          Text(
            'OR',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Login With Email and Password',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
