import "package:flutter/material.dart";
import "package:temp/utils/buttons.dart";

import "package:temp/models/qa.dart";
import "package:temp/data/qa_data.dart";

class QuizScreen extends StatefulWidget {
  final Function() endQuiz;
  const QuizScreen(this.endQuiz, {super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;

  void updateIndex() {
    setState(() {
      index += 1;
      //
    });
    if (index >= quiz.length) widget.endQuiz();
  }

  @override
  Widget build(context) {
    QaState qa = quiz[index];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(qa.question),
          ...qa.answers.map(
            (answer) => AnswerButton(
              onPressed: () {
                qa.submitAnswer(answer);
                updateIndex();
              },
              text: answer,
              //
            ),
          ),
          //
        ],
      ),
    );
  }
}
