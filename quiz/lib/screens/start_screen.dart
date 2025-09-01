import "package:flutter/material.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.startQuiz, {
    super.key,
    //
  });

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 320,
          color: const Color.fromARGB(180, 255, 255, 255),
        ),
        SizedBox(height: 80),
        Text(
          "Learn Flutter The Fun Way",
          style: TextStyle(
            color: const Color.fromARGB(255, 193, 170, 232),
            fontSize: 22,
            //
          ),
        ),
        SizedBox(height: 30),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 223, 210, 245),
            //
          ),
          label: Text("Start"),
          icon: Icon(Icons.arrow_right_alt),
          onPressed: startQuiz,
          //
        ),
      ],
    );
  }
}
