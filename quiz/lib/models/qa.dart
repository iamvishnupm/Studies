class QA {
  const QA(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> get shuffledAnswers => [...answers]..shuffle();
}
