import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habittracker/util/day.dart';
import 'package:habittracker/util/event.dart';

void main() {
  group('Day class:', () {
    test(
        'getEventListFromString method should correctly parse the input string for Event objects',
        () {
      final List<Event> events = [
        Event(color: Colors.blue, name: 'name1', value: 'value1'),
        Event(color: Colors.red, name: 'name2', value: 'value2'),
        Event(color: Colors.green, name: 'name3', value: 'value3'),
      ];

      final String eventsString =
          jsonEncode(events.map((event) => event.toString()).toList());

      expect(Day.getEventListFromString(eventsString), events);
    });

    test('fromMap factory constructor should create the correct object', () {
      final List<Event> events = [
        Event(color: Colors.blue, name: 'name1', value: 'value1'),
        Event(color: Colors.red, name: 'name2', value: 'value2'),
        Event(color: Colors.green, name: 'name3', value: 'value3'),
      ];

      final String eventsString =
          jsonEncode(events.map((event) => event.toString()).toList());

      final Map<String, dynamic> map = {
        'id': '2002-01-21',
        'event_list': eventsString,
      };

      final Day correctDay =
          Day(date: DateTime.parse('2002-01-21'), eventList: events);

      expect(Day.fromMap(map), correctDay);
    });

    test('toMap method should correctly convert Day to Map', () {
      final List<Event> events = [
        Event(color: Colors.blue, name: 'name1', value: 'value1'),
        Event(color: Colors.red, name: 'name2', value: 'value2'),
        Event(color: Colors.green, name: 'name3', value: 'value3'),
      ];

      final String eventsString =
          jsonEncode(events.map((event) => event.toString()).toList());

      final Map<String, dynamic> correctMap = {
        'id': '2002-01-21',
        'event_list': eventsString,
      };

      final Day day =
          Day(date: DateTime.parse('2002-01-21'), eventList: events);

      expect(day.toMap(), correctMap);
    });
  });
}
