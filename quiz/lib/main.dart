import "package:flutter/material.dart";

import "package:quiz/utils/gradient_container.dart";

import "package:quiz/screens/start_screen.dart";
import "package:quiz/screens/que_screen.dart";

void main() {
  runApp(
    MaterialApp(
      //
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
  late Widget activeScreen;

  final List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(startQuiz);
  }

  void startQuiz() {
    setState(() {
      activeScreen = QueScreen(onSelectAnswer: onSelectAnswer);
    });
  }

  void onSelectAnswer(String answer) {
    setState(() {
      activeScreen = StartScreen(startQuiz);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        colors: [
          const Color.fromARGB(255, 41, 12, 92),
          const Color.fromARGB(255, 98, 55, 172),
          //
        ],
        child: Center(child: activeScreen),
      ),
    );
  }
}
