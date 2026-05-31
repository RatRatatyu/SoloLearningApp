import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';



class TimeProvider extends ChangeNotifier {
  bool _isTimerRun = false;
  bool get isTimerRun => _isTimerRun;

  int _setMinutes = 1;
  int _setHourse = 0;


  Duration get countdownDuration => Duration(minutes: _setMinutes, hours: _setHourse);
  Timer? _timer;


  int get hours => _currentSeconds ~/ 3600;
  int get minutes => (_currentSeconds % 3600) ~/ 60;
  int get seconds => _currentSeconds % 60;


  late int _currentSeconds = countdownDuration.inSeconds;

  void startTimer() {
    if (_isTimerRun || _currentSeconds <= 0) return;

    _isTimerRun = true;
    WakelockPlus.enable();
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_currentSeconds > 0) {
        _currentSeconds--;
        notifyListeners();
      } else {
        stopTimer();
        resetTimer();
      }
    });
  }

  void resetTimer(){
    _currentSeconds = countdownDuration.inSeconds;
    notifyListeners();

  }

  void updateTimer(int hourse, int minutes){
    _setMinutes = minutes;
    _setHourse = hourse;
    resetTimer();

  }

  void stopTimer() {
    _timer?.cancel();
    _isTimerRun = false;
    WakelockPlus.disable();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
