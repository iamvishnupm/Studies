import "package:flutter/material.dart";
import "package:quiz/screens/start_screen.dart";
import "package:quiz/widgets/gradient_container.dart";

void main() {
  runApp(
    MaterialApp(
      //
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    ),
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(context) {
    return Scaffold(
      body: GradientContainer(
        colors: [
          //
          const Color.fromARGB(255, 27, 6, 62),
          const Color.fromARGB(255, 112, 68, 189),
        ],
        child: StartScreen(onPress: () {}),
      ),
    );
  }
}
