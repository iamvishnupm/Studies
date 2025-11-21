import "package:flutter/material.dart";

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F1720),
        leading: const BackButton(color: Colors.white),
      ),
      body: Center(
        child: Text(
          //
          "Music Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
