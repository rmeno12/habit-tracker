import 'package:flutter/material.dart';
import 'package:habittracker/widgets/event.dart';

import 'cell.dart';

class WeekView extends StatefulWidget {
  final DateTime lastDay;

  const WeekView(this.lastDay);

  @override
  WeekViewState createState() => new WeekViewState();
}

class WeekViewState extends State<WeekView> {
  int daysVisible = 5;
  bool isChanging = false;
  List<Event> eventList = [
    Event(DateTime.now(), Colors.blue, "e1", "v1"),
    Event(DateTime.now(), Colors.green, "e2", "v2"),
    Event(DateTime.now(), Colors.green, "e2", "v2"),
    Event(DateTime.now(), Colors.green, "e2", "v2"),
    Event(DateTime.now(), Colors.green, "e2", "v2"),
    Event(DateTime.now(), Colors.green, "e2", "v2"),
    Event(DateTime.now(), Colors.green, "e2", "v2"),
  ];

  Widget _buildCell(DateTime day) {
    bool isToday = day.day == DateTime.now().day &&
        day.month == DateTime.now().month &&
        day.year == DateTime.now().year;

    return Cell(
      day: day,
      isToday: isToday,
      events: eventList,
    );
  }

  List<Widget> _buildCells(int numVisible) {
    List<Widget> list = [];
    DateTime firstDay = widget.lastDay.subtract(Duration(days: numVisible - 1));

    for (int i = 0; i < daysVisible; i++) {
      list.add(_buildCell(firstDay.add(Duration(days: i))));
    }

    return list;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildCells(daysVisible),
      ),
    );
  }
}
