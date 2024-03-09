import 'package:flutter/material.dart';

class GoogleImage extends StatelessWidget {
  final String googleimagePath;
  const GoogleImage({
    super.key,
    required this.googleimagePath
  });

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
        onPressed: () {},
        child: Image.asset(googleimagePath,
        height: 90,

        ),
      ),
    );
  }
}
