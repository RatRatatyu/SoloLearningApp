import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solo_learning/state/stateProvider.dart';

class xpUpWidget extends StatelessWidget {
  const xpUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final xpRise = context.watch<stateProvider>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/catWorkOut.png',
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
              Text(
                "You complete your lesson!",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                "You earn +50HP!",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "Keep going!",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  xpRise.xpUp(50);
                  Navigator.pop(context);
                },
                child: Text("Claim XP"),
              ),
            ],
          )
        )
    );
  }
}
