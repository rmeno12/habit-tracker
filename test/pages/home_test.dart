import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habittracker/pages/home.dart';
import 'package:habittracker/widgets/week_view_pager.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: HomePage(),
  );

  testWidgets('Home Pagae UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    
    expect(find.byType(WeekViewPager), findsOneWidget);
  });
}