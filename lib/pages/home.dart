import 'package:flutter/material.dart';
import 'package:habittracker/widgets/database_tester.dart';
import 'package:habittracker/widgets/fab_menu.dart';
import 'package:habittracker/widgets/week_view_pager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: WeekViewPager()),
            DatabaseTester(),
          ],
        ),
      ),
      floatingActionButton: FabMenu(),
    );
  }
}
