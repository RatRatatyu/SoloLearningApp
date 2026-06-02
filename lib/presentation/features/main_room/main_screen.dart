import 'package:flutter/material.dart';
import 'package:solo_learning/presentation/features/main_room/widgets/motivation_words.dart';
import 'package:solo_learning/presentation/features/main_room/widgets/progress_widget.dart';
import 'package:solo_learning/presentation/features/main_room/data/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:solo_learning/screens/achievementsScreens/levelUpSreen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;


    //show level up congratulations screens
    final isLevelUp = context.select((StateProvider p) => p.isLevelUp);
    if (isLevelUp) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => levelUpWidget()),
        );
        if (!context.mounted) return;

        context.read<StateProvider>().resetLevelUp();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Solo Learning", style: TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [

          ContainerDecoration(child: MainProgressInfo()),
          ContainerDecoration(child: Container(),),
          ContainerDecoration(child: MotivationWords()),
        ],
      ),

    );
  }
}


class ContainerDecoration extends StatelessWidget {
  const ContainerDecoration({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
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
      margin: EdgeInsets.all(15),
      child: child,
    );
  }
}
