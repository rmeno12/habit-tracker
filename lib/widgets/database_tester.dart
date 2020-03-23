import 'package:flutter/material.dart';
import 'package:habittracker/util/database_helper.dart';
import 'package:habittracker/util/day.dart';
import 'package:habittracker/util/event.dart';

class DatabaseTester extends StatelessWidget {
  DatabaseTester();

  List<Event> eventList = [
    Event(color: Colors.blue, name: "e1", value: "v1"),
    Event(color: Colors.green, name: "e2", value: "v2"),
    Event(color: Colors.green, name: "e2", value: "v2"),
    Event(color: Colors.green, name: "e2", value: "v2"),
    Event(color: Colors.green, name: "e2", value: "v2"),
  ];
  DateTime now = DateTime.now();

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: () async {
            DatabaseHelper.db.newDay(Day(
                date: DateTime.parse(Day.formatter.format(now)),
                eventList: eventList));
          },
        ),
        RaisedButton(
          onPressed: () async {
            var result =
                await DatabaseHelper.db.getDay(Day.formatter.format(now));
            print(result);
          },
        ),
        RaisedButton(
          onPressed: () async {
            DatabaseHelper.db.deleteDay(Day(
                date: DateTime.parse(Day.formatter.format(now)),
                eventList: eventList));
          },
        ),
      ],
    );
  }
}
