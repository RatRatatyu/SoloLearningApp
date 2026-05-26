import 'package:flutter/material.dart';
import 'package:solo_learning/widgets/cardSample.dart';
import 'package:solo_learning/state/timerProvider.dart';
import 'package:provider/provider.dart';
import 'package:solo_learning/screens/addTimerScreen.dart';
import 'package:solo_learning/screens/timerScreen.dart';

class menedgerTimer extends StatelessWidget {
  const menedgerTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                child: ElevatedButton(onPressed: ()=> null, child: Icon(Icons.add, color: Colors.white, size: 25, ))
              ),
            ],
          ),
          Expanded(
            child: Consumer<timerProvider>(
              builder: (context, timerProvider, _) {
                final tasks = timerProvider.tasks;
                if(tasks.isEmpty){
                  return Column();
                }else{
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return GestureDetector(
                        onTap: () => null,
                        child: cardSampleWidget(task: task),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
