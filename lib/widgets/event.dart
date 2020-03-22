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
    Color color = Color(int.parse(parts[0]));
    String name = parts[1];
    String value = parts[2].substring(0, parts[2].length);

    return Event(color: color, name: name, value: value);
  }
}
