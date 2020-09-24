import 'package:flutter/material.dart';
import 'package:gpa_calculator_flutter/screens/class/components/body.dart';
import 'package:gpa_calculator_flutter/screens/result/result_screen.dart';
import 'package:gpa_calculator_flutter/size_config.dart';

class ClassScreen extends StatefulWidget {
  final int lessonCount;

  const ClassScreen({Key key, @required this.lessonCount}) : super(key: key);

  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  int lessonCount;
  @override
  void initState() {
    lessonCount = widget.lessonCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        lessonCount: lessonCount,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 8, top: 4, bottom: 4),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultScreen()),
              );
            },
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Text("Calculate",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 2)),
          ),
        ),
      ],
    );
  }
}
