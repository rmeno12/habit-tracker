import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habittracker/util/event.dart';

void main() {
  group('Event class:', () {
    test('toString method should output correctly', () {
      final Event event =
          Event(color: Colors.blue, name: 'name', value: 'value');

      String out = event.toString();
      String colorString = Colors.blue.value.toString();

      expect(out, '{' + colorString + ',name,value}');
    });

    test('fromString method should create the right Event', () {
      final String input = '{' + Colors.blue.value.toString() + ',name,value}';
      final Event correctEvent = Event(color: Colors.blue, name: 'name', value: 'value');

      expect(Event.fromString(input), correctEvent);
    });
  });
}
