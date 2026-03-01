import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solo_learning/screens/homePage.dart';
import 'package:provider/provider.dart';
import 'package:solo_learning/state/stateProvider.dart';

//temporarily
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    ChangeNotifierProvider(
        create: (_) => stateProvider(),
        child: const MyApp()
    ),
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
      ),
      home: SafeArea(child: const MyHomePage(),)
    );
  }
}

