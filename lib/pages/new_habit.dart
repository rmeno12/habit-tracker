import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habittracker/widgets/value_table.dart';

class NewHabitPage extends StatefulWidget {
  @override
  _NewHabitPageState createState() => _NewHabitPageState();
}

class _NewHabitPageState extends State<NewHabitPage> {
  final titleController = TextEditingController();
  final headerStyle = TextStyle(
    fontSize: 24,
  );
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Create a new habit',
                    style: TextStyle(
                      fontSize: 32,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                  child: Text(
                    'Give your habit a name',
                    style: headerStyle,
                  ),
                ),
                TextField(
                  controller: titleController,
                  decoration:
                      InputDecoration(hintText: 'Enter the name of your habit'),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                  child: Text(
                    'Add values to your habit',
                    style: headerStyle,
                  ),
                ),
                ValueTable(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Include a first day?'),
                    Checkbox(
                      value: dateIncluded,
                      onChanged: (value) {
                        setState(() {
                          dateIncluded = !dateIncluded;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(selectedDate == null || !dateIncluded
                        ? "No first day selected"
                        : "First day is $selectedDate"),
                    RaisedButton(
                      child: Text('Select date'),
                      onPressed: dateIncluded
                          ? () {
                              _selectDate(context);
                            }
                          : null,
                    ),
                  ],
                ),
                RaisedButton(
                  // TODO: Implement submission action
                  onPressed: () {},
                  child: Text('Create habit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
}
