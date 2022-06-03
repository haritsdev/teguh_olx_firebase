import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teguh_olx/screens/authentication/phone_auth_screen.dart';
import 'package:teguh_olx/screens/location_screen.dart';

class OTPScreen extends StatefulWidget {
  final String number, verId;

  OTPScreen({this.number, this.verId});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var _text1 = TextEditingController();
  var _text2 = TextEditingController();
  var _text3 = TextEditingController();
  var _text4 = TextEditingController();
  var _text5 = TextEditingController();
  var _text6 = TextEditingController();

  bool _loading = false;
  String error = '';

  Future<void> phoneCredential(
    BuildContext context,
    String otp,
  ) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verId, smsCode: otp);
      //need to otp validated or not
      var user = (await _auth.signInWithCredential(credential));
      if (user != null) {
        Navigator.pushReplacementNamed(context, LocationScreen.id);
        setState(() {
          error = 'Login failed';
        });
      } else {
        print('login failed');
      }
    } catch (e) {
      print(e.toString());
      setState(() {
        error = '${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false, //to remove background screen
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green[300],
                child: Icon(
                  CupertinoIcons.person_circle,
                  size: 60,
                  color: Colors.indigo,
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              'Welcome Back',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                RichText(
                    text: TextSpan(
                        text: 'We sent 6 digit code to  ',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        children: [
                      TextSpan(
                          text: widget.number,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15))
                    ])),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhoneAuthScreen()));
                    },
                    child: Icon(Icons.edit))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _text1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onChanged: (value) {
                      if (value.length == 1) {
                        focusNode.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text2,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onChanged: (value) {
                      if (value.length == 1) {
                        focusNode.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text3,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onChanged: (value) {
                      if (value.length == 1) {
                        focusNode.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text4,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onChanged: (value) {
                      if (value.length == 1) {
                        focusNode.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text5,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onChanged: (value) {
                      if (value.length == 1) {
                        focusNode.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text6,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onChanged: (value) {
                      if (value.length == 1) {
                        if (_text1.text.length == 1) {
                          if (_text2.text.length == 1) {
                            if (_text3.text.length == 1) {
                              if (_text4.text.length == 1) {
                                if (_text5.text.length == 1) {
                                  if (_text6.text.length == 1) {
                                    String _otp =
                                        '${_text1.text}${_text2.text}${_text3.text}${_text4.text}${_text5.text}${_text6.text}';

                                    setState(() {
                                      _loading = true;
                                    });
                                    //login
                                    print(_otp.toString());
                                    phoneCredential(context, _otp);
                                  }
                                }
                              }
                            }
                          }
                        }
                      } else {
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            if (_loading)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                ),
              ),
            SizedBox(
              height: 18,
            ),
            Text(
              error,
              style: TextStyle(
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
