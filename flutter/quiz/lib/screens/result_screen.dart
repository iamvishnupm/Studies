import "package:flutter/material.dart";

import "package:quiz/data/qa_data.dart";
import "package:quiz/widgets/ans_text.dart";
import "package:quiz/widgets/que_text.dart";

class ResultScreen extends StatefulWidget {
  final void Function() restartQuiz;

  const ResultScreen({
    //
    super.key,
    required this.restartQuiz,
  });
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          ...quiz.map((q) {
            return Card(
              color: q.userAnswer == q.correctAnswer
                  ? Colors.green.shade700
                  : Colors.red.shade700,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QueText(text: q.question),
                    const SizedBox(height: 10),
                    AnsText(text: "User: ${q.userAnswer}"),
                    AnsText(text: "Correct: ${q.correctAnswer}"),
                  ],
                ),
              ),
            );
          }),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: widget.restartQuiz,
            child: const Text("Restart Quiz"),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
