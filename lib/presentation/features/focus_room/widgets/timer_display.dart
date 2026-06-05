import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solo_learning/presentation/features/focus_room/data/timer_provider.dart';
import 'package:solo_learning/presentation/features/focus_room/widgets/timer_settings.dart';

import '../screens/aesthetic_timer_screen.dart';

class TimerDisplay extends StatelessWidget {
  const TimerDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var timer = context.watch<TimeProvider>();
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(

        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2, color: colorScheme.primary),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withAlpha(80),
            blurRadius: 20,
            spreadRadius: 6,
          ),
        ],
      ),
      margin: EdgeInsets.all(25),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0, left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Focus timer",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
                  ),
                  IconButton(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (_) => TimerSettingsDialog(),
                            barrierDismissible: false
                        );
                      },
                      icon: Icon(Icons.settings, color: Colors.white.withAlpha(80),)
                  )
                ],
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ClockBox(value: timer.hours.toString().padLeft(2, '0'), type: "Hours"),
              ClockBox(value: timer.minutes.toString().padLeft(2, '0'), type: "Minutes")
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (context) => const AestheticTimerScreen(),
                  )
                );
              },
              icon: Icon(Icons.play_arrow),
              color: Colors.white,
              iconSize: 30,
            ),
          )
        ],
      )

    );
  }
}

class ClockBox extends StatelessWidget {
  const ClockBox({super.key, required this.value, required this.type});

  final String value;
  final String type;
  
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Text(type, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
        Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(25),
          child: Text(value, style: Theme.of(context).textTheme.headlineMedium,),
        )
      ],
    );
  }
}
