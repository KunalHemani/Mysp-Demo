import 'package:ex_yt_login/pages/phone_screen.dart';
import 'package:flutter/material.dart';

class PhoneImage extends StatelessWidget {
  final String phoneimagepath;
  const PhoneImage({super.key, required this.phoneimagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.white),
          // borderRadius: BorderRadius.circular(6),
          // color: Colors.grey[300],
          ),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyPhone()));
          },
          child: Image.asset(phoneimagepath, height: 90)),
    );
  }
}
