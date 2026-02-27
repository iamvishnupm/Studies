import "dart:async";
import "package:flutter/material.dart";

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      //

      // 1st argument duration
      const Duration(seconds: 1),

      // 2nd argument call back fn
      (_) => setState(
        //
        () => _currentTime = DateTime.now(),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(DateTime t) {
    String h = t.hour.toString().padLeft(2, "0");
    String m = t.minute.toString().padLeft(2, "0");
    String s = t.second.toString().padLeft(2, "0");

    return "$h:$m:$s";
  }

  @override
  Widget build(context) {
    return Center(
      child: Text(
        _formatTime(_currentTime),
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          //
        ),
      ),
    );
  }
}
