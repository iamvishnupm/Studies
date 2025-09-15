import "package:flutter/material.dart";
import "package:temp/utils/buttons.dart";

class StartScreen extends StatelessWidget {
  final Function() onPressed;

  const StartScreen(
  //,
  {
    super.key,
    required this.onPressed,
    //
  });

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/logo.png", width: 300),
          SizedBox(height: 80),
          AnswerButton(
            onPressed: onPressed,
            text: "start",
            //
          ),
        ],
      ),
    );
  }
}
