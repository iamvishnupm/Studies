import "package:flutter/material.dart";

import "package:quiz/models/qa.dart";
import "package:quiz/data/qa_data.dart";
import "package:quiz/widgets/que_text.dart";

class QueScreen extends StatefulWidget {
  final void Function() endQuiz;
  const QueScreen({
    //
    super.key,
    required this.endQuiz,
  });

  @override
  State<QueScreen> createState() => _QueScreenState();
}

class _QueScreenState extends State<QueScreen> {
  int index = 0;

  void _nextQuestion() {
    setState(() {
      index += 1;
    });

    if (index >= quiz.length) widget.endQuiz();
  }

  @override
  Widget build(context) {
    QaState qa = quiz[index];
    return Padding(
      padding: const EdgeInsets.symmetric(
        //
        horizontal: 20,
        vertical: 0,
      ),
      child: Column(
        //
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          QueText(text: qa.question),
          SizedBox(height: 20),
          ...qa.answers.map(
            //
            (answer) => ElevatedButton(
              onPressed: () {
                qa.submitAnswer(answer);
                _nextQuestion();
              },
              style: ElevatedButton.styleFrom(
                //
                padding: EdgeInsets.all(20),
              ),
              child: Text(
                answer,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
