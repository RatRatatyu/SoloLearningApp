import 'dart:collection';

import 'package:flutter/material.dart';

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
  final List<TaskModel> _tasks = [];

  List<TaskModel> get tasksList => UnmodifiableListView(_tasks);

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