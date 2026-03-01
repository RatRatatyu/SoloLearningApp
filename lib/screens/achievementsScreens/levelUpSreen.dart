import 'package:flutter/material.dart';
import 'package:solo_learning/state/stateProvider.dart';
import 'package:provider/provider.dart';


class levelUpWidget extends StatelessWidget {
  const levelUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final level = context.select((stateProvider p) => p.levelNow);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('lib/assets/catHappy.png', height: 250, width: 250, fit: BoxFit.contain,),
            Text("You reached Level $level !", style: TextStyle(fontSize: 30, color: Colors.white),),
            SizedBox(height: 16,),
            Text("You doing perrrfect !", style: TextStyle(fontSize: 20, color: Colors.white),)

          ],
        ),
      )
    );
  }
}
