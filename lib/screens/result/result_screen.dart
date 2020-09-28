import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          Text("Your GPA is "),
          Text(
            "3.36",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
