import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habittracker/widgets/cell.dart';
import 'package:habittracker/widgets/week_view.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: WeekView(
      lastDay: DateTime.now(),
      selectionController: StreamController<DateTime>.broadcast(),
    ),
  );

  testWidgets('WeekView UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Cell), findsNWidgets(5));
  });
}