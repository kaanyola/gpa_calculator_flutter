import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            RotatedBox(
              quarterTurns: -1,
              child: Text(
                "Your GPA is ".toUpperCase(),
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
            ),
            Spacer(),
            Text(
              "3.36",
              style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
            Spacer(),
          ],
        ),
      )),
    );
  }
}
