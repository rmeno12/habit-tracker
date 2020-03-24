import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habittracker/util/day.dart';

import 'week_view.dart';

class WeekViewPager extends StatefulWidget {
  WeekViewPager();

  @override
  _WeekViewPagerState createState() => new _WeekViewPagerState();
}

class _WeekViewPagerState extends State<WeekViewPager> {
  StreamController<int> _selectionController;

  @override
  void initState() {
    super.initState();
    _selectionController = StreamController<int>.broadcast();
    _selectionController
        .add(DateTime.parse(Day.formatter.format(DateTime.now())).hashCode);
  }

  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(initialPage: 2048),
      itemBuilder: (BuildContext context, int index) {
        return WeekView(
          lastDay: DateTime.now().add(Duration(days: (index - 2048) * 7)),
          selectionController: _selectionController,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _selectionController.close();
  }
}
