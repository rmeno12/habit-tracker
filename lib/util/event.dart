import 'dart:ui';

class Event {
  final Color color;
  final String name;
  final String value;

  Event({this.color, this.name, this.value});

  @override
  String toString() {
    String out = '{';
    out += color.value.toString() + ',';
    out += name + ',';
    out += value + '}';

    return out;
  }

  static Event fromString(String inp) {
    List<String> parts = inp.split(',');
    Color color = Color(int.parse(parts[0].substring(1)));
    String name = parts[1];
    String value = parts[2].substring(0, parts[2].length - 1);

    return Event(color: color, name: name, value: value);
  }

  @override
  int get hashCode {
    int result = 13;
    result = 33 * result + color.hashCode;
    result = 33 * result + name.hashCode;
    result = 33 * result + value.hashCode;
    return result;
  }

  @override
  bool operator ==(dynamic other) {
    if (other is! Event) return false;
    Event event = other;
    return (event.color == color && event.name == name && event.value == value);
  }
}
