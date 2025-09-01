import "package:flutter/material.dart";

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.text, {
    super.key,
    required this.onTap,
    this.fontSize = 14,
    //
  });

  final String text;
  final void Function() onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 30, 6, 70),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          //
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
