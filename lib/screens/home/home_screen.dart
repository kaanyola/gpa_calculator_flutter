import 'package:flutter/material.dart';
import 'package:gpa_calculator_flutter/screens/home/components/body.dart';
import 'package:gpa_calculator_flutter/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
