import "package:flutter/material.dart";

class QueText extends StatelessWidget {
  final String text;

  const QueText({
    //
    super.key,
    required this.text,
  });

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        //
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
