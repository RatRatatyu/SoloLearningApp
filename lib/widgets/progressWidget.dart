import 'package:flutter/material.dart';

class mainProgressInfo extends StatelessWidget {
  const mainProgressInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
                  Text("Level 1", style: TextStyle(fontSize: 20, color: Colors.white),),
                  SizedBox(height: 30,),
                  Text("XP 100/1000", style: TextStyle(color: Colors.white),),
                  SizedBox(
                    width: 120,
                    child: LinearProgressIndicator(
                      value: 10/ 100,
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
             child:  Text("+50 XP to next level", style: TextStyle(fontSize: 15, color: Colors.white),),
           )
          ],
        )

      ],
    );
  }
}
