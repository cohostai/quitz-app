class Question {
  final String? question;
  Map<String, bool>? answers;
  String? yourAnswer;

  Question({this.question, this.answers, this.yourAnswer});

  static Question fromJson(Map<String, dynamic> json) {
    final question = json['question']['text'];
    Map<String, bool> answers = {};
    answers[json['correctAnswer'] ?? ''] = true;
    for (var item in json['incorrectAnswers']) {
      answers[item] = false;
    }
    return Question(question: question, answers: answers);
  }
}
