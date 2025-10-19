class QA {
  final String question;
  final List<String> answers;

  const QA(this.question, this.answers);

  String get correctAnswer => answers[0];
  List<String> get shuffledAnswers => [...answers]..shuffle();
}

class QaState extends QA {
  String? userAnswer;

  QaState(super.question, super.answers);

  static List<QaState> fromData(List<dynamic> data) {
    return data
        .map(
          (qa) => QaState(
            qa["question"] as String,
            List<String>.from(qa["answers"]),
          ),
        )
        .toList();
  }

  bool get isCorrect => userAnswer == correctAnswer;

  void submitAnswer(String answer) {
    userAnswer = answer;
  }
}
