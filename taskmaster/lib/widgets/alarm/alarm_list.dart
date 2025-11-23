import "package:flutter/material.dart";
import "package:taskmaster/widgets/alarm/alarm_item.dart";

class AlarmList extends StatelessWidget {
  final List<String> alarmList;

  const AlarmList({
    //
    super.key,
    required this.alarmList,
  });

  @override
  Widget build(context) {
    return Expanded(
      child: ListView.builder(
        itemCount: alarmList.length,
        itemBuilder: (_, i) {
          return AlarmItem(alarmText: alarmList[i]);
        },
      ),
    );
  }
}
