import 'package:ex_yt_login/components/MyButton.dart';
import 'package:ex_yt_login/components/my_text_field.dart';
import 'package:ex_yt_login/components/google_image.dart';
import 'package:ex_yt_login/components/phone_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ex_yt_login/pages/home old.dart';
import 'package:ex_yt_login/pages/register old.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    );

    // try sign in
    try{
     final response =  await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );

     print("Response == ${response.user}");
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print("error ==> ${e.code}");
      // pop the loading circle
      Navigator.pop(context);
      // Wrong Email
      if (e.code == 'user-not-found') {
        // wrongEmailMessage();
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.deepPurpleAccent,
              title: Text("User not found"),
            );
          },);
      }
      else if (e.code == 'invalid-email') {
        // wrongEmailMessage();
         showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.deepPurpleAccent,
              title: Text("Invalid email type"),
            );
          },);
      }
      else if (e.code == 'wrong-password') {
        // wrongPasswordMessage();
         showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Incorrect Password"),
            );
          },);
      }
    }
  }

  // Wrong Email Message
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.deepPurpleAccent,
            title: Text("Incorrect Email"),
          );
        },);
  }

  // Wrong Password Message
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Incorrect Password"),
        );
      },);
  }

  // void wrongEM() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Incorrect Email'),
  //         content: Text('Incorrect Email'),
  //       );
  //     },
  //   );
  // }
  //
  // void wrongPM() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         title: Text('Incorrect Password'),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15),

                //logo
                Icon(Icons.person, size: 150),

                // slogan

                // Username TextField
                SizedBox(height: 15),
                MyTextField(
                    controller: _emailController,
                    obscureText: false,
                    hintText: 'Username'),

                // Password TextField
                SizedBox(height: 15),
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                // Forgot Password
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // Signin Button
                SizedBox(height: 25),
                MyButton(
                  onTap: signUserIn,
                  // onTap: (){},
                ),

                // Or Continue With
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Continue With',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                // Google & Phone Image
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleImage(googleimagePath: 'assets/images/googlenew.png'),
                    SizedBox(width: 20),
                    PhoneImage(phoneimagepath: 'assets/images/phonenew.png')
                  ],
                ),

                // Not a user? Sign up now
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a user?',
                      style: TextStyle(fontSize: 17, color: Colors.grey[800]),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Sign-up now',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    // Old UI
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: Colors.grey[300],
    //     appBar: AppBar(
    //       backgroundColor: Colors.deepPurpleAccent,
    //       centerTitle: true,
    //       title: Text("LOGIN"),
    //     ),
    //
    //     // Old UI
    //     body: SingleChildScrollView(
    //       child: Container(
    //         padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
    //         child: Form(
    //           key: _myFormKey,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Image.asset(
    //                 "assets/images/login.png",
    //                 height: 200,
    //                 width: 200,
    //               ),
    //               SizedBox(height: 15),
    //               Padding(
    //                 padding: EdgeInsets.all(5.0),
    //                 child: TextFormField(
    //                   controller: _usernameController,
    //                   validator: (String? msg) {
    //                     if (msg!.isEmpty) {
    //                       return "Please enter email";
    //                     }
    //                     // Add more email validation if needed
    //                     return null;
    //                   },
    //                   decoration: InputDecoration(
    //                     labelText: "Email ID",
    //                     hintText: "Enter Email ID",
    //                     prefixIcon: Icon(Icons.email),
    //                     border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: 3),
    //               Padding(
    //                 padding: EdgeInsets.all(5.0),
    //                 child: TextFormField(
    //                   controller: _passwordController,
    //                   obscureText: true,
    //                   validator: (String? msg) {
    //                     if (msg!.isEmpty) {
    //                       return "Please enter password";
    //                     }
    //                     // Add more password validation if needed
    //                     return null;
    //                   },
    //                   decoration: InputDecoration(
    //                     labelText: "Password",
    //                     hintText: "Enter password",
    //                     prefixIcon: Icon(Icons.lock),
    //                     border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.all(10.0),
    //                 child: Container(
    //                   height: 50,
    //                   width: 550,
    //                   decoration: BoxDecoration(
    //                     color: Colors.deepPurpleAccent,
    //                     borderRadius: BorderRadius.circular(5),
    //                   ),
    //                   child: TextButton(
    //                     onPressed: () {
    //                       if (_myFormKey.currentState!.validate()) {
    //                         Navigator.push(
    //                           context,
    //                           MaterialPageRoute(builder: (context) => home()
    //                           ),
    //                         );
    //                       }
    //                     },
    //                     child: Center(
    //                       child: Text(
    //                         "Log In",
    //                         style: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: 20,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: <Widget>[
    //                   Text(
    //                     "Don't have an Account?",
    //                     style: TextStyle(
    //                       fontSize: 17,
    //                     ),
    //                   ),
    //                   TextButton(
    //                     onPressed: () {
    //                       Navigator.push(
    //                         context,
    //                         MaterialPageRoute(builder: (context) => regi()),
    //                       );
    //                     },
    //                     child: Text(
    //                       "Sign Up",
    //                       style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(height: 10),
    //               Row(
    //                 children: [
    //                   Expanded(
    //                       child: Divider(
    //                     thickness: 1,
    //                     color: Colors.black,
    //                   )),
    //                   Text("Or Continue With",
    //                   style: TextStyle(
    //                     fontSize: 15
    //                   ),),
    //                   Expanded(
    //                       child: Divider(
    //                     thickness: 1,
    //                     color: Colors.black,
    //                   )),
    //                 ],
    //               ),
    //               SizedBox(height: 35),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   SquareTile(imagePath: "assets/images/google.png"),
    //
    //                   SizedBox(width: 25),
    //
    //                   SquareTile(imagePath: "assets/images/phone.jpg")
    //                 ],
    //               )
    //               // Image.asset(
    //               //   "assets/images/google.png",
    //               //   height: 100,
    //               //   width: 100,
    //               // ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
