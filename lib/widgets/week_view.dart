import 'dart:async';

import 'package:flutter/material.dart';

import 'cell.dart';

class WeekView extends StatefulWidget {
  final int daysVisible = 5;
  final DateTime lastDay;
  final StreamController<int> selectionController;

  const WeekView({this.lastDay, this.selectionController});

  @override
  _WeekViewState createState() => new _WeekViewState();
}

class _WeekViewState extends State<WeekView> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  Widget _buildCell(DateTime day) {
    return Cell(
      date: day,
      selectionController: widget.selectionController,
    );
  }

  List<Widget> _buildCells() {
    List<Widget> list = [];
    DateTime firstDay = widget.lastDay.subtract(Duration(days: widget.daysVisible - 1));

    for (int i = 0; i < widget.daysVisible; i++) {
      list.add(_buildCell(firstDay.add(Duration(days: i))));
    }

    return list;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildCells(),
      ),
    );
  }
}
