import 'package:flutter/material.dart';
import 'package:habittracker/util/day.dart';

class UpdateHabitPage extends StatefulWidget {
  UpdateHabitPage({Key key}) : super(key: key);

  @override
  _UpdateHabitPageState createState() => _UpdateHabitPageState();
}

class _UpdateHabitPageState extends State<UpdateHabitPage> {
  DateTime selectedDate = DateTime.parse(Day.formatter.format(DateTime.now()));

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2012),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('$selectedDate'.split(' ')[0]),
              RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
