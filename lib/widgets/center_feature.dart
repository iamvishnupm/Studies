import "package:flutter/material.dart";

class CenterFeature extends StatelessWidget {
  final IconData icon;
  final String label;
  const CenterFeature({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    // Just a centered icon inside a soft circle
    const circleColor = Color(0x0AFFFFFF); // light translucent white

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 260,
            height: 260,
            decoration: const BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(icon, size: 120, color: Colors.grey)),
          ),
          Text(label, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
