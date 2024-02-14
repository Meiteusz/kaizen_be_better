import 'package:flutter/material.dart';

class IdeasScreen extends StatefulWidget {
  const IdeasScreen({super.key});

  @override
  State<IdeasScreen> createState() => _IdeasScreenState();
}

class _IdeasScreenState extends State<IdeasScreen> {
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
