import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habittracker/util/day.dart';
import 'package:habittracker/widgets/cell.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: Flex(direction: Axis.horizontal, children: <Widget>[
      Cell(
        date: DateTime.parse(Day.formatter.format(DateTime.now())),
        selectionController: StreamController<DateTime>.broadcast(),
      ),
    ]),
  );

  testWidgets('Cell UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(AspectRatio), findsOneWidget);
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(StreamBuilder), findsOneWidget);
    expect(find.byType(AnimatedContainer), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(FutureBuilder), findsOneWidget);
  });
}
