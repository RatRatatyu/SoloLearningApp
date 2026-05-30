import 'package:flutter/material.dart';
import 'package:solo_learning/state/stateProvider.dart';

class TimeProvider extends ChangeNotifier {
  bool _isTimerRun = false;
  bool get isTimerRun => _isTimerRun;

}
