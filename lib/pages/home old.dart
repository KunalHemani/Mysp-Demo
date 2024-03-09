import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "MainPage",
    theme: ThemeData(
      primarySwatch: Colors.brown,
    ),
  ));
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("INFO"),
        ),
        body: Material(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              // margin: EdgeInsets.all(7.0),
              child: Table(border: TableBorder.all(), children: const [
                TableRow(children: [
                  Text("PIC", style: TextStyle(fontSize: 20.0)),
                  Text("DESCRIPTION", style: TextStyle(fontSize: 20.0)),
                ]),
                TableRow(
                  children: [
                    Text("no.", style: TextStyle(fontSize: 20.0)),
                    Text(
                      "Designed for the jet-setter in mind, our shirt is the ideal blend of comfort and style. Built for the man who’s in demand, this classic design will keep you looking presentable on the go, with a gentle fabric for all-day comfort. Because you won’t perform at your best if you’re irritated by your clothing. Our shirt is a sleek take on a well-loved classic featuring a tried-and-tested spread collar and a slim fit styling.",
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                )
              ])),
        ));
  }
}
