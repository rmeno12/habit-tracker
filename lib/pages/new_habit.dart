import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewHabitPage extends StatefulWidget {
  @override
  _NewHabitPageState createState() => _NewHabitPageState();
}

class _NewHabitPageState extends State<NewHabitPage> {
  final titleController = TextEditingController();
  bool dateIncluded = false;
  DateTime selectedDate;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
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
            padding: EdgeInsets.all(12),
            child: ListView(
              children: <Widget>[
                Text(
                  'Create a new habit',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                TextField(
                  controller: titleController,
                  decoration:
                      InputDecoration(hintText: 'Enter the name of your habit'),
                ),
                Text('header: values'),
                Text('thing to add/remove types of values'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('date picker for first day'),
                    Checkbox(
                      value: dateIncluded,
                      onChanged: (value) {
                        setState(() {
                          dateIncluded = !dateIncluded;
                        });
                        print(value);
                      },
                    )
                  ],
                ),
                RaisedButton(
                  child: Text('Select date'),
                  onPressed: dateIncluded
                      ? () {
                          _selectDate(context);
                        }
                      : null,
                ),
                Text(selectedDate == null || !dateIncluded
                    ? "No date selected"
                    : "First day is $selectedDate"),
                RaisedButton(
                  // TODO: Implement submission action
                  onPressed: () {},
                  child: Text('Create habit'),
                )
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
}
