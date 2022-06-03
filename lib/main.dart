import 'package:flutter/material.dart';
import 'package:teguh_olx/screens/authentication/phone_auth_screen.dart';
import 'package:teguh_olx/screens/location_screen.dart';
import 'package:teguh_olx/screens/login_screen.dart';
import 'package:teguh_olx/screens/location_screen.dart';
import 'package:teguh_olx/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.indigo[400], fontFamily: 'Lato'),
        debugShowCheckedModeBanner: false,
        // initialRoute: LoginScreen.id,
        home: LoginScreen(),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
          LocationScreen.id: (context) => LocationScreen()
        });
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Replace the 3 second delay with your initialization code:
//       future: Future.delayed(Duration(seconds: 3)),
//       builder: (context, AsyncSnapshot snapshot) {
//         // Show splash screen while waiting for app resources to load:
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return MaterialApp(home: SplashScreen());
//         } else {
//           // Loading is done, return the app:
//           return MaterialApp(
//               theme: ThemeData(
//                   primaryColor: Colors.indigo[400], fontFamily: 'Lato'),
//               debugShowCheckedModeBanner: false,
//               // initialRoute: LoginScreen.id,
//               home: LoginScreen(),
//               routes: {
//                 LoginScreen.id: (context) => LoginScreen(),
//                 PhoneAuthScreen.id: (context) => PhoneAuthScreen()
//               });
//         }
//       },
//     );
//   }
// }
