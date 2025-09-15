import "package:flutter/material.dart";
import "package:temp/data/qa_data.dart";

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            quiz
                .map(
                  (qa) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        qa.question,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      Text("User Answer : ${qa.userAnswer}"),
                      Text("Correct Answer : ${qa.correctAnswer}"),
                    ],
                  ),
                )
                .toList(),
      ),
    );
  }
}
