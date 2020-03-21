import 'package:flutter/material.dart';

import 'event.dart';

class Cell extends StatelessWidget {
  DateTime _day;
  bool _isToday;
  List<Event> _events;

  Cell({DateTime day, bool isToday, List<Event> events}) {
    _day = day;
    _isToday = isToday;
    _events = events;
  }

  Widget build(BuildContext build) {
    return Expanded(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 12),
          child: AspectRatio(
            aspectRatio: 1.0 / 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    _day.day.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  decoration: _isToday
                      ? BoxDecoration(
                          // color: Colors.deepPurple,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2.0,
                          ))
                      : BoxDecoration(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
