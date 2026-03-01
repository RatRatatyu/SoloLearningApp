import 'dart:async';
import 'package:solo_learning/screens/achievementsScreens/XpUpScreen.dart';
import 'package:flutter/material.dart';

class timerScreen extends StatefulWidget {
  const timerScreen({super.key});

  @override
  State<timerScreen> createState() => _timerScreenState();
}

class _timerScreenState extends State<timerScreen> {
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController secondsController = TextEditingController();

  Duration remainingTime = Duration.zero;
  Timer? timer;
  bool isRunning = false;

  void startTimer() {
    if (isRunning) return;

    final int hours = int.tryParse(hoursController.text) ?? 0;
    final int minutes = int.tryParse(minutesController.text) ?? 0;
    final int seconds = int.tryParse(secondsController.text) ?? 0;

    setState(() {
      remainingTime = Duration(
        hours: hours,
        minutes: minutes,
        seconds: seconds,
      );
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime -= const Duration(seconds: 1);
        });
      } else {
        t.cancel();
        setState(() {
          isRunning = false;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context)=> xpUpWidget()));
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    final hours = twoDigits(d.inHours);
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));

    return "$hours : $minutes : $seconds";
  }

  @override
  void dispose() {
    timer?.cancel();
    hoursController.dispose();
    minutesController.dispose();
    secondsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: hoursController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      labelText: "Hours",
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: minutesController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      labelText: "Minutes",
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondsController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      labelText: "Seconds",
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              formatTime(remainingTime),
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text("Start"),
                ),
                ElevatedButton(
                  onPressed: stopTimer,
                  child: const Text("Stop"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}