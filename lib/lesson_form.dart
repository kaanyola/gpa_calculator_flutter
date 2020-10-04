import 'package:flutter/material.dart';
import 'package:gpa_calculator/lesson.dart';

class LessonForm extends StatefulWidget {
  final Lesson lesson;
  final state = _LessonFormState();
  final String sistem;
  final String harf;
  final List<String> harfler;
  LessonForm({Key key, this.lesson, this.sistem, this.harf, this.harfler})
      : super();
  @override
  _LessonFormState createState() => _LessonFormState();
}

class _LessonFormState extends State<LessonForm> {
  final form = GlobalKey<FormState>();
  List<String> harfler;
  String harf;
  TextEditingController myController = new TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  var _harfler1 = ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  var _harfler2 = ["A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "F"];
  var _harfler3 = [
    "A1",
    "A2",
    "A3",
    "B1",
    "B2",
    "B3",
    "C1",
    "C2",
    "C3",
    "D",
    "F"
  ];
  var _krediSayisi = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];
  var _krediSayi = 1;
  var _harf1 = "AA";
  var _harf2 = "A";
  var _harf3 = "A1";
  var buton = "Kaydet";

  @override
  Widget build(BuildContext context) {
    var ikon = "save";
    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
        key: form,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 4.0, left: 4.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      initialValue: widget.lesson.name,
                      onSaved: (val) => widget.lesson.name = val,
                      decoration: InputDecoration(hintText: "Ders Adı"),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text("$buton"),
                    onPressed: () {
                      setState(() {
                        form.currentState.save();
                        buton = "Kaydedildi";
                      });
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Dersin Kredisi:"),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                      child: Row(
                        children: <Widget>[
                          DropdownButton<int>(
                            value: _krediSayi,
                            onChanged: (int newValue) {
                              setState(() {
                                _krediSayi = newValue;
                                widget.lesson.kredi = newValue;
                              });
                            },
                            items: _krediSayisi.map((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text("$value"),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Harf Notu:"),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                      child: DropdownButton<String>(
                        value: widget.lesson.harfNotu,
                        onChanged: (String newValue) {
                          setState(() {
                            _harf1 = newValue;
                            widget.lesson.harfNotu = newValue;
                          });
                        },
                        items: widget.lesson.harfler.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
