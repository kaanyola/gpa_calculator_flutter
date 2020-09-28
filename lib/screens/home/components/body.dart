import 'package:flutter/material.dart';
import 'package:gpa_calculator_flutter/constants.dart';
import 'package:gpa_calculator_flutter/screens/class/class_screen.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator_flutter/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void buttonFunc(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hata"),
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();
  final _text = TextEditingController();
  bool isEmptyField = true;
  int lessonCount;
  int group = 1;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultSize * 5),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildWelcomText(context),
                SizedBox(
                  height: defaultSize * 10,
                ),
                buildTextFormField(),
                SizedBox(
                  height: defaultSize * 2,
                ),
                Text("Choose your grade type:"),
                SizedBox(
                  height: defaultSize * 1,
                ),
                buildRadioButtons(),
                SizedBox(
                  height: defaultSize * 4,
                ),
                buildContinueButton(defaultSize, context),
                SizedBox(
                  height: defaultSize * 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildContinueButton(double defaultSize, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        height: defaultSize * 6,
        color: Theme.of(context).primaryColor,
        onPressed: () {
          if (_text.text.isEmpty) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Error!"),
                  content: Text("Number of classes field cannot be empty."),
                  actions: [
                    FlatButton(
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              },
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClassScreen(
                        lessonCount: lessonCount,
                      )),
            );
          }
          print(lessonCount);
        },
        child: Text(
          "Continue",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: defaultSize * 1.8,
              letterSpacing: 2),
        ),
      ),
    );
  }

  Text buildWelcomText(BuildContext context) {
    return Text(
      "Welcome!",
      style: Theme.of(context).textTheme.headline4.copyWith(
          fontSize: SizeConfig.defaultSize * 5,
          fontWeight: FontWeight.bold,
          letterSpacing: SizeConfig.defaultSize * 0.5),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: _text,
      key: _formKey,
      validator: (value) {
        if (_text.text.isNotEmpty) {
          isEmptyField = false;
        } else {
          isEmptyField = true;
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          print(value);
          lessonCount = int.parse(value);
          print(value);
          if (_text.text.isNotEmpty) {
            isEmptyField = false;
          } else {
            isEmptyField = true;
          }
          print(isEmptyField.toString());
        });
      },
      decoration: InputDecoration(
          labelText: "Class Number",
          hintText: "Enter the number of classes",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }

  Row buildRadioButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  group = value;
                });
              },
            ),
            Column(
              children: [
                Text(
                  "AA",
                ),
                Text("BA"),
                Text("BB"),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  group = value;
                });
              },
            ),
            Column(
              children: [
                Text("A1"),
                Text("A2"),
                Text("A3"),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 3,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  group = value;
                });
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("A"),
                Text("A-"),
                Text("B+"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
