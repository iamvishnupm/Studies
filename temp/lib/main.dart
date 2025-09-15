import "package:flutter/material.dart";
import "package:temp/utils/gradient_container.dart";
import "package:temp/screens/start_screen.dart";
import "package:temp/screens/quiz_screen.dart";
import "package:temp/screens/result_screen.dart";

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Widget activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(onPressed: startQuiz);
  }

  void startQuiz() {
    setState(() {
      activeScreen = QuizScreen(endQuiz);
    });
  }

  void endQuiz() {
    setState(() {
      activeScreen = ResultScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          colors: [
            const Color.fromARGB(255, 59, 18, 130),
            const Color.fromARGB(255, 100, 60, 169),
            //
          ],
          child: activeScreen,
        ),
      ),
    );
  }
}
