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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildMarkers() {
    bool isOverflow = widget.events.length > 7;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: isOverflow
            ? widget.events.map((event) => _buildMarker(event.color)).toList()
            : <Widget>[
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      '+' + (widget.events.length - 4).toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ] +
                widget.events
                    .sublist(0, 4)
                    .map((event) => _buildMarker(event.color))
                    .toList(),
      ),
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
