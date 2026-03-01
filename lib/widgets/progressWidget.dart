import 'package:flutter/material.dart';
import 'package:solo_learning/state/stateProvider.dart';
import 'package:provider/provider.dart';

class mainProgressInfo extends StatelessWidget {
  const mainProgressInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final level = context.select((stateProvider p) => p.levelNow);
    final xp = context.select((stateProvider p) => p.totalXpNow);
    final nextXp = context.select((stateProvider p)=> p.nextLevelXp);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all( width: 2, color: colorScheme.primary)
          ),
          child: Row(
            children: [Column(
                children: [
                  Image.asset('lib/assets/catSleep.png', height: 150, width: 200, fit: BoxFit.contain,)
                ]
            ),
              SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Level $level", style: TextStyle(fontSize: 20, color: Colors.white),),
                  SizedBox(height: 30,),
                  Text("XP $xp/$nextXp", style: TextStyle(color: Colors.white),),
                  SizedBox(
                    width: 120,
                    child: LinearProgressIndicator(
                      value: xp/ nextXp,
                      minHeight: 12,
                      backgroundColor: Colors.grey.shade800,
                      valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
                    ),
                  )
                ],
              )],
          ),
        ),
        Row(
          children: [

           Container(
             padding: EdgeInsets.all(10),
             child:  Text("+"+ (nextXp-xp).toString() +"XP to next level", style: TextStyle(fontSize: 15, color: Colors.white),),
           )
          ],
        )

      ],
    );
  }
}
