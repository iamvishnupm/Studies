class QA {
  final String question;
  final List<String> answers;

  /* ============================================ */

  const QA(this.question, this.answers);

  factory QA.fromMap(Map<String, dynamic> map) {
    return QA(
      map["question"] as String,
      List<String>.from(map['answers']),
      //
    );
  }

  // make a list of QA with this, let's call it QAList.
  static List<QA> fromData(List<dynamic> data) {
    return data
        .map(
          (qa) => QA.fromMap(qa),
          //
        )
        .toList();
  }

  /* ============================================ */

  List<String> get shuffledAnswers => [...answers]..shuffle();

  /* ============================================ */

  String get correctAnswer => answers[0];

  /* ============================================ */
}

class QAState {
  final QA qa;
  String? userAnswer;

  QAState(this.qa);

  // convert the QAList to list of QAState with this - call it quiz.
  static List<QAState> fromQAList(List<QA> questions) {
    return questions.map((q) => QAState(q)).toList();
  }

  String get question => qa.question;
  String get answer => qa.correctAnswer;

  bool get isCorrect => userAnswer == answer;

  List<String> get shuffledAnswers => qa.shuffledAnswers;

  void submitAnswer(String answer) {
    userAnswer = answer;
  }
}

// class QuizState {
//   final List<QAState> quiz;

//   QuizState(this.quiz); // passing the quiz here.

//   int get legth => quiz.length;

//   int get score => quiz.fold(0, (s, q) => s + (q.isCorrect ? 1 : 0));
// }
