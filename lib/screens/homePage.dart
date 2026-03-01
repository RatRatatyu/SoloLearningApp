import 'package:flutter/material.dart';
import 'package:solo_learning/screens/mainScreen.dart';
import 'package:solo_learning/screens/timerscreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _selectIndex =0;
  final List<Widget> _pages =[
    mainScreen(),
    timerScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final backGroundColor = Theme.of(context).scaffoldBackgroundColor;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: IndexedStack(
        index: _selectIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(

        selectedIndex: _selectIndex,
        onDestinationSelected: (int index) => setState(() => _selectIndex= index),
        indicatorColor: colorScheme.primary,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: backGroundColor,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined ,color: Colors.white,), label: 'home'),
          NavigationDestination(icon: Icon(Icons.timer_outlined, color: Colors.white,), label: 'time'),
         ],
      ),


    );
  }
}
