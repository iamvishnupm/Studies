import 'dart:async';
import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();
  final List<String> _alarms = [];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _currentTime = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(DateTime t) {
    final hour = t.hour.toString().padLeft(2, '0');
    final minute = t.minute.toString().padLeft(2, '0');
    final second = t.second.toString().padLeft(2, '0');
    return "$hour:$minute:$second";
  }

  @override
  Widget build(BuildContext context) {
    final clock = Text(
      _formatTime(_currentTime),
      style: const TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.w700,
        letterSpacing: 2,
        color: Colors.grey,
      ),
    );

    return Container(
      child: _alarms.isEmpty
          ? Center(child: clock)
          : Column(
              children: [
                const SizedBox(height: 16),
                clock,
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    itemCount: _alarms.length,
                    itemBuilder: (_, idx) => ListTile(
                      title: Text(
                        _alarms[idx],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
