import 'package:flutter/material.dart';
import 'package:habittracker/util/event.dart';

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
    Event(color: Colors.blue, name: "e1", value: "v1"),
    Event(color: Colors.green, name: "e2", value: "v2"),
    Event(color: Colors.green, name: "e2", value: "v2"),
    Event(color: Colors.green, name: "e2", value: "v2"),
    Event(color: Colors.green, name: "e2", value: "v2"),
  ];

  Widget _buildCell(DateTime day) {
    return Cell(
      date: day,
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
