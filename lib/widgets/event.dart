import 'dart:ui';

class Event {
  DateTime _date;
  Color _color;
  String _name;
  String _value;

  DateTime get date {
    return _date;
  }

  Color get color {
    return _color;
  }

  String get name {
    return _name;
  }

  String get value {
    return _value;
  }

  Event(DateTime date, Color color, String name, String value) {
    _date = date;
    _color = color;
    _name = name;
    _value = value;
  }
}
