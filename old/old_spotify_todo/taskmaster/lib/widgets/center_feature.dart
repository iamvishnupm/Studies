import "package:flutter/material.dart";

class CenterFeature extends StatelessWidget {
  final String label;
  final IconData icon;

  const CenterFeature({
    super.key,
    required this.label,
    required this.icon,
    //
  });

  @override
  Widget build(context) {
    const color1 = Color(0x0AFFFFFF);
    const color2 = Colors.grey;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 260,
            width: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color1,
              //
            ),
            child: Center(child: Icon(icon, size: 120, color: color2)),
          ),
          SizedBox(height: 10),
          Text(label, style: TextStyle(color: color2)),
        ],
      ),
    );
  }
}
