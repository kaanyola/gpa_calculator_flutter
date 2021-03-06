import 'package:flutter/material.dart';
import 'package:gpa_calculator_flutter/size_config.dart';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  final int lessonCount;

  const Body({Key key, this.lessonCount}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List _gradesAA = ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  List _gradesType2 = [
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
  List _gradesType3 = ["A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D", "F"];
  int lessonCount;

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentGrade;
  List<String> currentGrades;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String grade in _gradesAA) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(value: grade, child: new Text(grade)));
    }
    return items;
  }

  void changedDropDownItem(String selectedGrade) {
    print("Selected city $selectedGrade, we are going to refresh the UI");
    setState(() {
      _currentGrade = selectedGrade;
    });
  }

  void initState() {
    lessonCount = widget.lessonCount;
    _dropDownMenuItems = getDropDownMenuItems();
    _currentGrade = _dropDownMenuItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double defaultSize = SizeConfig.defaultSize;
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: lessonCount,
        itemBuilder: (context, index) {
          return buildClassCard(width, height, context, index);
        },
      ),
    );
  }

  Padding buildClassCard(
      double width, double height, BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(width * 0.025),
      child: Container(
        padding: EdgeInsets.all(width * 0.025),
        width: width * 0.4,
        height: SizeConfig.defaultSize * 22,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 8,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixText: (index + 1).toString() + ".",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixStyle: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 20),
                    hintText: "Class name"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Grade:"),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  DropdownButton(
                    value: _currentGrade,
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem,
                  ),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(hintText: "Input your credit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double ortHesapla() {
  double result;
  int toplamKredi;
  return result;
}
