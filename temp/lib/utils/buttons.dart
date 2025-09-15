import "package:flutter/material.dart";

class AnswerButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const AnswerButton(
  //,
  {
    super.key,
    required this.onPressed,
    required this.text,
    //
  });

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      //
    );
  }
}
