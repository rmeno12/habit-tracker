import 'package:flutter/material.dart';

import 'event.dart';

class Cell extends StatefulWidget {
  final maxMarkers = 7;
  final DateTime day;
  final bool isToday;
  final List<Event> events;

  const Cell({this.day, this.isToday, this.events});


  CellState createState() => new CellState();
}

class CellState extends State<Cell> {
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
        widget.day.day.toString(),
        style: TextStyle(
          color: widget.isToday ? Colors.deepPurple : Colors.grey,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildMarkers() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          widget.events.map((event) => _buildMarker(event.color)).toList(),
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
