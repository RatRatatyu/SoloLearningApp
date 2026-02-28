import 'package:flutter/material.dart';
import 'package:solo_learning/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color.fromRGBO(18, 16, 30, 1),
      ),
      home: SafeArea(child: const MyHomePage(),)
    );
  }
}

