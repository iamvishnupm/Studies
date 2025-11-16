import "package:flutter/material.dart";

class CenterFeature extends StatelessWidget {
  final IconData icon;
  const CenterFeature({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    // Just a centered icon inside a soft circle
    const circleColor = Color(0x0AFFFFFF); // light translucent white

    return Center(
      child: Container(
        width: 260,
        height: 260,
        decoration: const BoxDecoration(
          color: circleColor,
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, size: 120, color: Colors.grey)),
      ),
    );
  }
}
