import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/timer_provider.dart';

class TimerSettingsDialog extends StatefulWidget {
  const TimerSettingsDialog({super.key});

  @override
  State<TimerSettingsDialog> createState() => _TimerSettingsDialogState();
}

class _TimerSettingsDialogState extends State<TimerSettingsDialog> {
  int _hours = 0;
  int _minutes = 30;

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Change timer value"),
      content: Row(
        children: [
          NewValueChoose(
              type: "hours",
              changeValue: (value) {
                _hours = value;
              }
          ),
          NewValueChoose(
              type: "minutes",
              changeValue:  (value) {
                _minutes = value;
              }
          )
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel")
        ),
        ElevatedButton(
            onPressed: () {
              context.read<TimeProvider>().updateTimer(_hours, _minutes);
              Navigator.of(context).pop();
            },
            child: Text("Save")
        )
      ],
    );
  }
}


class NewValueChoose extends StatelessWidget {
  const NewValueChoose({super.key, required this.type, required this.changeValue});

  final String type;
  final ValueChanged<int> changeValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(type, style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(
          width: 100,
          height: 100,
          child: ListWheelScrollView.useDelegate(
              itemExtent: 30,
              perspective: 0.005,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: changeValue,
              childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context,index){
                    return Center(
                      child: Text(
                        index.toString().padLeft(2,"0"),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  },
                  childCount: 60
              )
          ),
        )
      ],
    );
  }
}
