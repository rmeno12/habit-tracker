import 'dart:convert';

import 'package:habittracker/util/event.dart';

class Day {
  final DateTime date;
  final List<Event> eventList;

  Day({this.date, this.eventList});

  Map<String, dynamic> toMap() {
    return {
      'id': date,
      'event_list': createEventsString(),
    };
  }

  String createEventsString() {
    List<String> stringsList = eventList.map((event) => event.toString()).toList();
    String json = jsonEncode(stringsList);

    return json;
  }
}