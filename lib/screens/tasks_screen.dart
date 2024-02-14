import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
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
