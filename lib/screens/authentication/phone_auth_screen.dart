import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teguh_olx/services/phone_auth_service.dart';
import 'package:legacy_progress_dialog/legacy_progress_dialog.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = 'phone-auth-screen';

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  bool validate = false;
  var countryCodeController = TextEditingController(text: '+62');
  var phoneNumberController = TextEditingController();

  showAlertDialog(BuildContext context) {
    //Create an instance of ProgressDialog

    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: 8,
          ),
          Text('Please wait')
        ],
      ),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  PhoneAuthService _service = PhoneAuthService();

  phoneAuthentication(number) {
    print(number);
  }

  String counterText = '0';
  @override
  Widget build(BuildContext context) {
    ProgressDialog progressDialog = ProgressDialog(
      context: context,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      loadingText: 'Mohon Tunggu',
      progressIndicatorColor: Theme.of(context).primaryColor,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.indigo[200],
              child: Icon(
                CupertinoIcons.person_alt_circle,
                color: Colors.indigo,
                size: 60,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Enter your phone',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'We will send confirmation code to your phone',
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        controller: countryCodeController,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: 'Country',
                          counterStyle: TextStyle(fontSize: 12),
                        ),
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.only(top: 6),
                      child: TextFormField(
                        autofocus: true,
                        maxLength: 13,
                        keyboardType: TextInputType.phone,
                        controller: phoneNumberController,
                        onChanged: (value) {
                          if (value.length > 10) {
                            setState(() {
                              validate = true;
                            });
                          } else {
                            validate = false;
                          }
                        },
                        decoration: InputDecoration(
                            // counterText: '$counterText',
                            // counterStyle: TextStyle(fontSize: 12),
                            labelText: 'Number',
                            hintText: 'Wnter your phone number',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AbsorbPointer(
            absorbing: validate ? false : true,
            child: ElevatedButton(
              onPressed: () {
                progressDialog.show();
                String number =
                    '${countryCodeController.text}${phoneNumberController.text}';
                print(number);

                _service.verifyPhoneNumber(context, number);
                phoneAuthentication(number)
                    .whenComplete(() => progressDialog.dismiss());
              },
              style: ButtonStyle(
                  backgroundColor: validate
                      ? MaterialStateProperty.all(
                          Theme.of(context).primaryColor)
                      : MaterialStateProperty.all(Colors.grey)),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    showAlertDialog(context); // it will close alert dialog
    super.dispose();
  }
}
