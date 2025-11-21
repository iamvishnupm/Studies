import "package:flutter/material.dart";

class AlarmItem extends StatelessWidget {
  final String alarmText;

  const AlarmItem({
    //
    super.key,
    required this.alarmText,
  });

  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            alarmText,
            style: TextStyle(
              //
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Spacer(),
          Icon(Icons.edit, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.delete, color: Colors.white),
        ],
      ),
    );
  }
}
