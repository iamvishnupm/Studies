import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "package:quiz/data/qa_data.dart";
import "package:quiz/utils/buttons.dart";

class QueScreen extends StatefulWidget {
  const QueScreen(
    this.endQuiz, {
    super.key,
    //
  });

  final void Function() endQuiz;

  @override
  State<QueScreen> createState() => _QueScreenState();
}

class _QueScreenState extends State<QueScreen> {
  var index = 0;

  void updateIndex() {
    setState(() {
      index += 1;
    });
    if (index >= quiz.length) widget.endQuiz();
  }

  @override
  Widget build(BuildContext context) {
    var qa = quiz[index];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          Text(
            qa.question,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 208, 181, 247),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ...qa.shuffledAnswers.map((answer) {
            return AnswerButton(
              answer,
              onTap: () {
                qa.submitAnswer(answer);
                updateIndex();
              },
              // fontSize: 14,
            );
          }),
        ],
      ),
    );
  }
}
