import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:solo_learning/state/stateProvider.dart';

class TaskModel{
  final String id;
  final String title;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

class TaskProvider extends ChangeNotifier{
  final List<TaskModel> _tasks = [TaskModel(title: "Work out", id: "123", isCompleted: false),
    TaskModel(title: "Study Flutter", id: "124", isCompleted: false),
  ];

  List<TaskModel> get tasks => UnmodifiableListView(_tasks);

  void addTask(String title){
    if(title.isEmpty) return;

    final newTask = TaskModel(
        id: DateTime.now().toString(),
        title: title,
    );

    _tasks.add(newTask);
    notifyListeners();
  }

  void deleteTask(String id){
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();

  }

  void completeTask(String id){
    final taskIndex = _tasks.indexWhere((task) => task.id == id);

    if(taskIndex != -1){
      _tasks[taskIndex].isCompleted = true;
      notifyListeners();
    }
  }

}