import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:solo_learning/presentation/features/focus_room/data/timer_provider.dart';


class AestheticTimerScreen extends StatefulWidget {
  const AestheticTimerScreen({super.key});

  @override
  State<AestheticTimerScreen> createState() => _AestheticTimerScreenState();
}

class _AestheticTimerScreenState extends State<AestheticTimerScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var timer = context.watch<TimeProvider>();
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white.withAlpha(80)),
        backgroundColor: backgroundColor,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClockDecoration(value: timer.hours.toString().padLeft(2, "0"), type: "Hours"),
          ClockDecoration(value: timer.minutes.toString().padLeft(2, "0"), type: "Minutes"),
          ClockDecoration(value: timer.seconds.toString().padLeft(2, "0"), type: "Seconds", isLast: true,),

        ],
      ),
      backgroundColor: backgroundColor,
    );
  }
}


class ClockDecoration extends StatelessWidget {
  const ClockDecoration({super.key, required this.value, required this.type, this.isLast = false});

  final String value;
  final String type;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          type,
          style:  Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 140,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 20,
                    color: colorScheme.primary,
                  )
                ],
              ),
            ),
            if (!isLast) ...[
              const SizedBox(width: 10),
              Text(
                ":",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 10),
            ]
          ],
        )
      ],
    );
  }
}
