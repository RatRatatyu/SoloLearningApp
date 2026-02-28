import 'package:flutter/material.dart';
import 'package:solo_learning/widgets/progressWidget.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Solo Learning", style: TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 16,),
          Container(
            decoration: BoxDecoration(

              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 2, color: colorScheme.primary),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withOpacity(0.6),
                  blurRadius: 12,
                  spreadRadius: 3,
                ),
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 6,
                ),
              ],
            ),
            margin: EdgeInsets.all(15),
            height: 220,
            child: mainProgressInfo(),
          ),
          SizedBox(height: 16,),
          Container(
            margin: EdgeInsets.all(15),
            height: 90,
            color: Colors.white,
          ),
          SizedBox(height: 16,),
          Container(
            margin: EdgeInsets.all(15),
            height: 200,
            color: Colors.white,
          ),



        ],
      ),

    );
  }
}
