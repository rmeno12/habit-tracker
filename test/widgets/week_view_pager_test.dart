import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habittracker/widgets/week_view_pager.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: WeekViewPager(),
  );

  testWidgets('WeekViewPager UI Tests', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    expect(find.byType(PageView), findsOneWidget);
  });
}