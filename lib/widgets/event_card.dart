import 'package:flutter/material.dart';

@immutable
class EventCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const EventCard({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 12,
            height: 55,
            color: color,
            margin: EdgeInsets.only(right: 8),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(value,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
