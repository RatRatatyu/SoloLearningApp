import 'package:flutter/material.dart';
import 'package:solo_learning/presentation/features/focus_room/data/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:solo_learning/presentation/features/focus_room/widgets/tasks_add_new.dart';

class TasksDisplay extends StatelessWidget {
  const TasksDisplay({super.key});

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
        margin: EdgeInsets.all(25),
        child: ListTask()
     );
  }
}


class ListTask extends StatelessWidget {
  const ListTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final listTask = taskProvider.tasksList;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0, left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Daily tasks",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => TasksAddNew(),
                        barrierDismissible: false
                    );
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  tooltip: 'Add Task',
                ),
              ],
            )
          ),
        ),
        Expanded(
          child: listTask.isEmpty
              ? Center(
            child: Text(
              "No tasks for today!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white60),
            ),
          )
            : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: listTask.length,
              itemBuilder: (context, index) {
            final task = listTask[index];

            return Dismissible(
              key: Key(task.id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction){
                taskProvider.deleteTask(task.id);
              },
                background: Container(
                  color: colorScheme.primary.withAlpha(80),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
              child: ListTile(
                titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: task.isCompleted ? Colors.white38 : Colors.white,
                ),
                title: Text(task.title),
                trailing: Checkbox(
                  value: task.isCompleted,
                  activeColor: colorScheme.primary,
                  onChanged: task.isCompleted
                    ? null
                    : (value) => taskProvider.completeTask(task.id),
                    ),
                  )
            );
            },
          ),
        ),
      ],
    );
  }
}
