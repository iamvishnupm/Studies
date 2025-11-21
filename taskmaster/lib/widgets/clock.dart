import "dart:async";
import "package:flutter/material.dart";
import "package:taskmaster/utils/functions.dart";

class Clock extends StatelessWidget {
  Clock({super.key});

  final Stream<DateTime> _timeStream = Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  ).asBroadcastStream();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: _timeStream,
      initialData: DateTime.now(),
      builder: (_, snapshot) {
        final time = formatTime(snapshot.data!);
        return Text(time, style: TextStyle(color: Colors.white, fontSize: 50));
      },
    );
  }
}
