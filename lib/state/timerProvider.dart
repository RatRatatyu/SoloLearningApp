import 'package:flutter/material.dart';

class TimerTask {
  final String name;
  final int totalSeconds;
  int elapsedSeconds;
  bool isRunning;

  TimerTask({
    required this.name,
    required this.totalSeconds,
    this.elapsedSeconds = 0,
    this.isRunning = false,
  });

  double get progress => elapsedSeconds / totalSeconds;
}


class timerProvider extends ChangeNotifier{

  final List<TimerTask> tasks = [];

  void addTask(TimerTask task) {
    tasks.add(task);
    notifyListeners();
  }

  void startTask(int index) {
    tasks[index].isRunning = true;
    notifyListeners();
  }


  void stopTask(int index) {
    tasks[index].isRunning = false;
    notifyListeners();
  }
}