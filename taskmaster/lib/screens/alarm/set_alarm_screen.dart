import "package:flutter/material.dart";
import "package:taskmaster/utils/functions.dart";
import "package:taskmaster/screens/music_screen.dart";

class SetAlarmScreen extends StatefulWidget {
  const SetAlarmScreen({super.key});

  @override
  State<SetAlarmScreen> createState() => _SetAlarmScreenState();
}

class _SetAlarmScreenState extends State<SetAlarmScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> openTimePicker() async {
    final picked = await pickTime(context, selectedTime);
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  @override
  Widget build(context) {
    //

    Widget timeText = Text(
      "${selectedTime.hour.toString().padLeft(2, '0')}"
      " : "
      "${selectedTime.minute.toString().padLeft(2, '0')}",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F1720),
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 80),
          Center(
            child: GestureDetector(
              onTap: openTimePicker,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  //
                  horizontal: 30,
                  vertical: 20,
                ),
                child: timeText,
              ),
            ),
          ),
          SizedBox(height: 80),
          TextButton.icon(
            label: Text(
              "Select Music",
              style: TextStyle(
                //
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              loadScreen(context, MusicScreen());
            },
            icon: Icon(Icons.music_note, color: Colors.white, size: 20),
            //
          ),
        ],
      ),
    );
  }
}
