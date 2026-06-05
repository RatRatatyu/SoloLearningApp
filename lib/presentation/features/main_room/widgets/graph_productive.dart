import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:solo_learning/presentation/features/focus_room/data/task_provider.dart';
import 'package:provider/provider.dart';

class GraphProductive extends StatelessWidget {
  const GraphProductive({super.key});


  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final tasks = taskProvider.tasksList;
    const colorNotDoneTask = Color.fromRGBO(52, 47, 73, 1.0);
    const colorDoneTask = Color.fromRGBO(121, 108, 166, 1.0);

    return Padding(
        padding: EdgeInsets.all(20),
        child: AspectRatio(
            aspectRatio: 10/2,
            child: PieChart(
              PieChartData(
                  sections: [
                    if (tasks.isEmpty)
                      buildPieSection(
                        value: 100,
                        title: "No task done yet!",
                        titlePosition: true,
                        color: colorNotDoneTask,
                      )
                    else...[
                      buildPieSection(
                        value: (tasks.where((task) => task.isCompleted == true)).length.toDouble(),
                        title: "Done",
                        titlePosition: false,
                        color: colorDoneTask,
                      ),
                      buildPieSection(
                        value: (tasks.where((task) => task.isCompleted == false)).length.toDouble(),
                        title: "Not done",
                        titlePosition: false,
                        color: colorNotDoneTask,
                      )
                    ]
                  ],
                  centerSpaceRadius: 0,
              )
            )
        ),

    );
  }
}


PieChartSectionData buildPieSection({
  required double value,
  required String title,
  required Color color,
  required bool titlePosition,
}) {
  return PieChartSectionData(
    value: value,
    title: title,
    titlePositionPercentageOffset: titlePosition? 0.1 : 0.5 ,
    color: color,
    radius: 150,
    titleStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}
