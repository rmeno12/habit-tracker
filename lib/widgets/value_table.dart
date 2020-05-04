import 'package:flutter/material.dart';

class ValueTable extends StatefulWidget {
  @override
  _ValueTableState createState() => _ValueTableState();
}

class _ValueTableState extends State<ValueTable> {
  List<TableRow> _rows = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('Add a new value'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
        Table(
          children: _rows,
        ),
      ],
    );
  }
}
