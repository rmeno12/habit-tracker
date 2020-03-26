import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habittracker/util/database_helper.dart';
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
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              children = <Widget>[Text('nothing selected')];
            } else {
              children = <Widget>[Text(snapshot.data.toString())];
              return FutureBuilder<dynamic>(
                  future: DatabaseHelper.db
                      .getDay(Day.formatter.format(snapshot.data)),
                  builder: (context2, snapshot2) {
                    if (snapshot2.hasData) {
                      if (snapshot2.data is Day) {
                        children = <Widget>[
                              Text(
                                DateFormat('EEEE, MMMM d')
                                    .format(snapshot2.data.date),
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              )
                            ] +
                            snapshot2.data.eventList.map<Widget>((event) => EventCard(
                                  title: event.name,
                                  value: event.value,
                                  color: event.color,
                                )).toList();
                          print('here');
                      } else if (snapshot2.data is int) {
                        children = <Widget>[
                          Text(
                            DateFormat('EEEE, MMMM d').format(snapshot.data),
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
                  });
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );
          }),
    );
  }
}
