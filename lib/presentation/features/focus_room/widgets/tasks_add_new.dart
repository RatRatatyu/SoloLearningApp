import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/task_provider.dart';


class TasksAddNew extends StatefulWidget {
  const TasksAddNew({super.key});

  @override
  State<TasksAddNew> createState() => _TasksAddNewState();
}

class _TasksAddNewState extends State<TasksAddNew> {

  String _finalTaskName = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add new task!"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (text) {
              _finalTaskName = text;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task"
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              context.read<TaskProvider>().addTask(_finalTaskName);
              Navigator.of(context).pop();
            },
            child: Text("Save")
        ),
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel")
        )
      ],
    );
  }
}

