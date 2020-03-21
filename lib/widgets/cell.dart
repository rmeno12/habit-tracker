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
                _buildText(),
                _buildMarkers(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Container(
      padding: EdgeInsets.all(6),
      child: Text(
        _day.day.toString(),
        style: TextStyle(
          color: _isToday ? Colors.deepPurple : Colors.grey,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildMarkers() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _events.map((event) => _buildMarker(event.color)).toList(),
    );
  }

  Widget _buildMarker(Color color) {
    return Container(
      height: 10.0,
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
