import 'package:ex_yt_login/pages/home.dart';
import 'package:ex_yt_login/pages/phone_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _OTPScreenState extends State<OTPScreen> {
  var code = "";
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   "assets/images/logo.png",
              //   height: 150,
              //   width: 150,
              // ),
              SizedBox(height: 22),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Register your phone number here!",
                  style: TextStyle(fontSize: 22), textAlign: TextAlign.center),

              SizedBox(height: 30),

              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value){
                  code = value;
                },
              ),

              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try{
                      PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(
                          verificationId: MyPhone.verify, smsCode: code);
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(context, "HomePage", (route) => true);
                    }
                    catch (e){
                      print("Wrong OTP");
                    }
                  },
                  child: Text(
                    "VERIFY",
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
