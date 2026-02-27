import "package:flutter/material.dart";
import "package:taskmaster/widgets/alarm/clock.dart";
import "package:taskmaster/widgets/alarm/alarm_list.dart";

class AlarmScreen extends StatelessWidget {
  final VoidCallback setAlarm;
  // final List<String> alarmList = [];
  final List<String> alarmList = ["11:22", "33:44"];

  AlarmScreen({super.key, required this.setAlarm});

  @override
  Widget build(context) {
    //

    final Widget clickableClock = GestureDetector(
      onTap: setAlarm,
      child: Clock(),
    );

    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF0F1720)),
      body:
          //
          alarmList.isEmpty
          //
          ? Center(child: clickableClock)
          //
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                clickableClock,
                SizedBox(height: 20),
                AlarmList(alarmList: alarmList),
              ],
            ),
    );
  }
}
