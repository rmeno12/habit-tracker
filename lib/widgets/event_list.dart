import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habittracker/util/day_database_helper.dart';
import 'package:habittracker/util/day.dart';
import 'package:habittracker/widgets/event_card.dart';
import 'package:intl/intl.dart';

class EventList extends StatefulWidget {
  final StreamController<DateTime> selectionController;
  EventList({this.selectionController});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: StreamBuilder<dynamic>(
          stream: widget.selectionController.stream,
          builder: (context, snapshot) => _buildStreamBuilder(snapshot)),
    );
  }

  Widget _buildFutureBuilder(
      AsyncSnapshot streamSnapshot, AsyncSnapshot futureSnapshot) {
    if (futureSnapshot.hasData) {
      if (futureSnapshot.data is Day) {
        children = <Widget>[
              Text(
                DateFormat('EEEE, MMMM d').format(futureSnapshot.data.date),
                style: TextStyle(
                  fontSize: 24,
                ),
              )
            ] +
            futureSnapshot.data.eventList
                .map<Widget>((event) => EventCard(
                      title: event.name,
                      value: event.value,
                      color: event.color,
                    ))
                .toList();
        print('here');
      } else if (futureSnapshot.data is int) {
        children = <Widget>[
          Text(
            DateFormat('EEEE, MMMM d').format(streamSnapshot.data),
            style: TextStyle(
              fontSize: 24,
            ),
          )
        ];
      }
    }
    return Column(
      children: children,
    );
  }

  Widget _buildStreamBuilder(AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
      children = _buildNothingSelected();
    } else {
      children = <Widget>[Text(snapshot.data.toString())];
      return FutureBuilder<dynamic>(
          future: DayDatabaseHelper.db.getDay(Day.formatter.format(snapshot.data)),
          builder: (context2, snapshot2) =>
              _buildFutureBuilder(snapshot, snapshot2));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  List<Widget> _buildNothingSelected() {
    return <Widget>[Text('nothing selected')];
  }
}
