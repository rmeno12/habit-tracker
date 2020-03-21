import 'package:flutter/material.dart';

class WeekView extends StatefulWidget {
  WeekView();

  @override
  WeekViewState createState() => new WeekViewState();
}

class WeekViewState extends State<WeekView> {
  int daysVisible = 5;
  DateTime today = DateTime.now();

  Widget _buildCard(DateTime day) {
    return Expanded(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 12),
          child: AspectRatio(
            aspectRatio: 1.0 / 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(day.day.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCards(int numVisible) {
    List<Widget> list = [];
    DateTime firstDay = today.subtract(Duration(days: numVisible));

    for (int i = 0; i < daysVisible; i++) {
      list.add(_buildCard(firstDay.add(Duration(days: i))));
    }

    return list;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildCards(daysVisible),
      ),
    );
  }
}
