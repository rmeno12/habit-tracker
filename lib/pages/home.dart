import 'package:flutter/material.dart';
import 'package:habittracker/widgets/database_tester.dart';
import 'package:habittracker/widgets/week_view_pager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: WeekViewPager()),
            DatabaseTester(),
          ],
        ),
      ),
    );
  }
}
