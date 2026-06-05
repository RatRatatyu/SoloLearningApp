import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solo_learning/presentation/features/focus_room/data/task_provider.dart';
import 'package:solo_learning/presentation/homePage.dart';
import 'package:provider/provider.dart';
import 'package:solo_learning/presentation/features/main_room/data/state_provider.dart';
import 'package:solo_learning/presentation/features/focus_room/data/timer_provider.dart';


void main() async {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => StateProvider()),
      ChangeNotifierProvider(create: (_) => TimeProvider()),
      ChangeNotifierProvider(create: (_) => TaskProvider())
    ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color.fromRGBO(18, 16, 30, 1),
        cardColor: const Color.fromRGBO(62, 62, 80, 1),
      ),
      home: SafeArea(child: const MyHomePage(),)
    );
  }
}

