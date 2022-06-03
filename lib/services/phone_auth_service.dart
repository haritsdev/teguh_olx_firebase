import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teguh_olx/screens/authentication/otp_screen.dart';

class PhoneAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool error = false;
  User user;

  Future<void> verifyPhoneNumber(BuildContext context, number) async {
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      try {
        //  user= await auth.signInWithPhoneNumber(credential);
        //   print(credential);
        print(credential);
      } catch (e) {
        print("Failed to sign in: " + e.toString());
        error = true;
      }
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('Code is not invalid');
      }
      print('the error is ${e.code}');
    };

    final PhoneCodeSent codeSent = (String verId, int resendToken) async {
      //if OTP Screen now new screen to shouuld open to enter OTP
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTPScreen(
                    number: number,
                    verId: verId,
                  )));
    };

    try {
      auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationId) {
            print(verificationId);
          });
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }
}
