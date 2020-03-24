import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habittracker/util/database_helper.dart';
import 'package:habittracker/util/day.dart';

class Cell extends StatefulWidget {
  final maxMarkers = 7;
  final DateTime date;
  final StreamController<DateTime> selectionController;

  const Cell({this.date, this.selectionController});

  _CellState createState() => new _CellState();
}

class _CellState extends State<Cell> with TickerProviderStateMixin {
  bool isToday;
  Future<dynamic> day;

  @override
  void initState() {
    super.initState();
    isToday = widget.date.day == DateTime.now().day &&
        widget.date.month == DateTime.now().month &&
        widget.date.year == DateTime.now().year;

    day = DatabaseHelper.db.getDay(Day.formatter.format(widget.date));

    // _borderController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 400),
    // );
  }

  Widget build(BuildContext build) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.selectionController
              .add(DateTime.parse(Day.formatter.format(widget.date)));
        },
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
      ),
    );
  }

  Widget _buildText() {
    return StreamBuilder<dynamic>(
        stream: widget.selectionController.stream,
        builder: (context, snapshot) {
          bool isSelected = snapshot.data ==
              DateTime.parse(Day.formatter.format(widget.date));
          return AnimatedContainer(
              duration: Duration(milliseconds: 100),
              padding: EdgeInsets.all(6),
              child: Text(
                widget.date.day.toString(),
                style: TextStyle(
                  color: isToday ? Colors.deepPurple : Colors.grey,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: isSelected ? Colors.deepPurple : Colors.grey),
                borderRadius: isSelected
                    ? BorderRadius.circular(32)
                    : BorderRadius.circular(4),
              ));
        });
  }

  Widget _buildMarkers() {
    List<Widget> children;

    return FutureBuilder<dynamic>(
        future: day,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            if (data is Day) {
              bool isOverflow = data.eventList.length > 4;
              children = isOverflow
                  ? data.eventList
                      .map((event) => _buildMarker(event.color))
                      .toList()
                  : <Widget>[
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            '+' + (data.eventList.length - 4).toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[500],
                            ),
                          ),
                        )
                      ] +
                      data.eventList
                          .sublist(0, 4)
                          .map((event) => _buildMarker(event.color))
                          .toList();
            } else {
              children = <Widget>[Container()];
            }
          } else {
            children = <Widget>[CircularProgressIndicator()];
          }
          return Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        });
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
