import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habittracker/pages/new_habit.dart';
import 'package:habittracker/pages/update_habit.dart';
import 'package:habittracker/util/day.dart';
import 'package:habittracker/widgets/database_tester.dart';
import 'package:habittracker/widgets/event_list.dart';
import 'package:habittracker/widgets/fab_menu.dart';
import 'package:habittracker/widgets/week_view_pager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<DateTime> _selectionController;
  DateTime initDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectionController = StreamController<DateTime>.broadcast();
    _selectionController
        .add(DateTime.parse(Day.formatter.format(DateTime.now())));
  }

  @override
  void dispose() {
    super.dispose();
    _selectionController.close();
  }

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
              child: WeekViewPager(
                selectionController: _selectionController,
                initDate: initDate,
              ),
            ),
            DatabaseTester(),
            EventList(
              selectionController: _selectionController,
            ),
          ],
        ),
      ),
      floatingActionButton: FabMenu(
        onNewButtonPressed: () {
          _newButtonCallback();
        },
        onUpdateButtonPressed: () {
          _updateButtonCallback();
        },
      ),
    );
  }

  void _newButtonCallback() async {
    final newDay = await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => NewHabitPage()));

    _selectionController.add(newDay);
    setState(() {
      if (newDay != null) {
        initDate = newDay;
      }
    });
  }

  void _updateButtonCallback() async {
    final newDay = await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => UpdateHabitPage()));

    _selectionController.add(newDay);
    setState(() {
      if (newDay != null) {
        initDate = newDay;
      }
    });
  }
}
