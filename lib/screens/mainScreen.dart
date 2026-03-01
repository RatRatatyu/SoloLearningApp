import 'package:flutter/material.dart';
import 'package:solo_learning/widgets/progressWidget.dart';
import 'package:solo_learning/state/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:solo_learning/screens/achievementsScreens/levelUpSreen.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final colorScheme = Theme.of(context).colorScheme;


    //show level up congratulations screen
    final isLevelUp = context.select((stateProvider p) => p.isLevelUp);
    if (isLevelUp) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => levelUpWidget()),
        );
        if (!context.mounted) return;

        context.read<stateProvider>().resetLevelUp();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Solo Learning", style: TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),

          Container(
            decoration: BoxDecoration(

              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 2, color: colorScheme.primary),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withAlpha(60),
                  blurRadius: 12,
                  spreadRadius: 3,
                ),
                BoxShadow(
                  color: colorScheme.primary.withAlpha(80),
                  blurRadius: 20,
                  spreadRadius: 6,
                ),
              ],
            ),
            margin: EdgeInsets.all(15),
            height: 220,
            child: mainProgressInfo(),
          ),
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(

              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 2, color: colorScheme.primary),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withAlpha(60),
                  blurRadius: 12,
                  spreadRadius: 3,
                ),
                BoxShadow(
                  color: colorScheme.primary.withAlpha(80),
                  blurRadius: 20,
                  spreadRadius: 6,
                ),
              ],
            ),
            margin: EdgeInsets.all(15),
            height: 300,
          ),
        ],
      ),

    );
  }
}
