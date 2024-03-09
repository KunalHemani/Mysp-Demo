import 'package:ex_yt_login/components/auth_page.dart';
import 'package:ex_yt_login/components/otp_screen.dart';
import 'package:ex_yt_login/pages/home.dart';
import 'package:ex_yt_login/pages/login.dart';
import 'package:ex_yt_login/pages/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    // initialRoute: 'login',
    // routes: {'phone_screen':(context) => MyPhone(), 'otp_screen': (context) => OTPScreen()},
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(
//       //   primarySwatch: Colors.yellow,
//       // ),
//
//       // home: AuthPage(),
//     );
//   }
// }
