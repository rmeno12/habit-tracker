import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habittracker/util/event.dart';
import 'package:intl/intl.dart';

@immutable
class Day {
  final DateTime date;
  final List<Event> eventList;

  Day({this.date, this.eventList});

  factory Day.fromMap(Map<String, dynamic> json) => new Day(
        date: DateTime.parse(json['id']),
        eventList: getEventListFromString(json['event_list']),
      );

  Map<String, dynamic> toMap() => {
        'id': createDateString(),
        'event_list': createEventsString(),
      };

  String createEventsString() {
    List<String> stringsList =
        eventList.map((event) => event.toString()).toList();
    String json = jsonEncode(stringsList);

    return json;
  }

  String createDateString() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String dateString = formatter.format(date);

    return dateString;
  }

  static List<Event> getEventListFromString(String inp) {
    List<Event> events = List<Event>.from(
        json.decode(inp).map((event) => Event.fromString(event)).toList());

    return events;
  }

  @override
  int get hashCode {
    return date.hashCode + eventList.hashCode;
  }

  @override
  bool operator ==(dynamic other) {
    if (other is! Day) return false;
    Day day = other;
    return (day.date == date && listEquals(day.eventList, eventList));
  }

  @override
  String toString() {
    String out = '{';
    out += date.toString() + ',';
    out += eventList.toString() + '}';

    return out;
  }
}
