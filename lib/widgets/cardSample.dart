import 'package:flutter/material.dart';
import 'package:solo_learning/state/timerProvider.dart';

class cardSampleWidget extends StatelessWidget {
  const cardSampleWidget({super.key, required this.task});

  final TimerTask task;

  @override
  Widget build(BuildContext context) {

    final colorCard = Theme.of(context).cardColor;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.all(14),
      child: Card(
        color: colorCard,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: 90,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 5,
                      value: task.progress,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
                    ),
                    Text(
                      "${(task.progress * 100).toStringAsFixed(0)}% ",
                      style: TextStyle(color: Colors.white70),
                    ),

                  ],
                ),
                SizedBox(width: 50,),
                Text(task.name, style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            )
          )
        ),
      ),
    );
  }
}
