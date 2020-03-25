import 'dart:async';

import 'package:flutter/material.dart';

import 'week_view.dart';

class WeekViewPager extends StatefulWidget {
  final StreamController<DateTime> selectionController;
  WeekViewPager({this.selectionController});

  @override
  _WeekViewPagerState createState() => new _WeekViewPagerState();
}

class _WeekViewPagerState extends State<WeekViewPager> {

  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(initialPage: 2048),
      itemBuilder: (BuildContext context, int index) {
        return WeekView(
          lastDay: DateTime.now().add(Duration(days: (index - 2048) * 7)),
          selectionController: widget.selectionController,
        );
      },
    );
  }
}
