import 'package:flutter/material.dart';
import 'package:solo_learning/presentation/features/focus_room/widgets/timer_display.dart';

class FocusScreen extends StatelessWidget {
  const FocusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: TimerDisplay(),
        ),
        Expanded(
          flex: 2,
          child: Placeholder()
        )
      ],
    );
  }
}
