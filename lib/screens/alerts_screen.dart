import 'package:flutter/material.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Task 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Task 2'),
              ),
            )
          ],
        )
    );
  }
}
