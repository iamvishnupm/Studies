import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "package:quiz/data/qa_data.dart";
import "package:quiz/utils/buttons.dart";

class QueScreen extends StatefulWidget {
  const QueScreen({
    super.key,
    required this.onSelectAnswer,
    //
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QueScreen> createState() => _QueScreenState();
}

class _QueScreenState extends State<QueScreen> {
  var index = 0;

  void answerQuestion(String answer) {
    if (index < QAdata.length - 1) {
      setState(() {
        index += 1;
      });
    } else {
      widget.onSelectAnswer(answer);
    }
  }

  @override
  Widget build(BuildContext context) {
    var qa = QAdata[index];

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
                answerQuestion(answer);
              },
              // fontSize: 14,
            );
          }),
        ],
      ),
    );
  }
}
