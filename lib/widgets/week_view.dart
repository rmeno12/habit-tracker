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
    bool isToday = day.day == today.day &&
        day.month == today.month &&
        day.year == today.year;

    return Expanded(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 12),
          child: AspectRatio(
            aspectRatio: 1.0 / 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  decoration: isToday ? BoxDecoration(
                    // color: Colors.deepPurple,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.deepPurple, width: 2.0,)
                  ) : BoxDecoration(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCards(int numVisible) {
    List<Widget> list = [];
    DateTime firstDay = today.subtract(Duration(days: numVisible - 1));

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
