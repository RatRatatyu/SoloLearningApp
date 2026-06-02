import 'dart:math';

import 'package:flutter/material.dart';

class MotivationWords extends StatefulWidget {
  const MotivationWords({super.key});

  @override
  State<MotivationWords> createState() => _MotivationWordsState();
}

class _MotivationWordsState extends State<MotivationWords> {

  // TODO: organize a separate class with quotes in the future and load from there
  final List<String> _quotes =  [
    "Keep moving, you're on the right track!",
    "Every small step brings you closer to your big goal.",
    "Focus is a superpower. Turn it up to maximum.",
    "Mistakes are proof that you are trying.",
    "Your future is created by what you do today."
  ];

  final Random _random = Random();
  late Stream<String> _stream;

  @override
  void initState() {
    super.initState();

    _stream = Stream.periodic(
      const Duration(minutes: 5),
        (_) => _quotes[_random.nextInt(_quotes.length)],
    ).map((quote)=> quote);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _stream,
        initialData: _quotes[_random.nextInt(_quotes.length)],
        builder: (context, snapshot){
          return Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  snapshot.data ?? "",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
              ),
          );
        }
    );
  }
}
