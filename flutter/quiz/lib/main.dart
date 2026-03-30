import "package:flutter/material.dart";
import "package:quiz/screens/que_screen.dart";
import "package:quiz/screens/result_screen.dart";
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
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(onPress: startQuiz);
  }

  void startQuiz() {
    setState(() {
      activeScreen = QueScreen(endQuiz: endQuiz);
    });
  }

  void endQuiz() {
    setState(() {
      activeScreen = ResultScreen(restartQuiz: restartQuiz);
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = StartScreen(onPress: startQuiz);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: GradientContainer(
        colors: [
          //
          const Color.fromARGB(255, 27, 6, 62),
          const Color.fromARGB(255, 112, 68, 189),
        ],
        child: activeScreen!,
      ),
    );
  }
}
