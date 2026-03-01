import 'package:flutter/material.dart';
import 'package:solo_learning/screens/achievementsScreens/levelUpSreen.dart';

class stateProvider extends ChangeNotifier{
  bool isLevelUp = false;
  int levelNow = 1;
  late int nextLevelXp = 100;
  int totalXpNow = 0;

  void levelUp(){
    levelNow++;
    isLevelUp = true;
    nextLevelXp = levelNow * 100;
    notifyListeners();
  }

  void resetLevelUp(){
    isLevelUp = false;
    notifyListeners();
  }

  void xpUp(int xp){
    totalXpNow += xp;
    if (totalXpNow >= nextLevelXp){
      totalXpNow -= nextLevelXp;
      levelUp();
    }
    notifyListeners();
  }

}