import 'package:dio/dio.dart';
import 'package:quitz_app/model/question.dart';

class QuestionController {
  final Dio _dio = Dio();
  List<Question> questions = [];
  bool isLoading = true;
  int currentQuestion = 0;
  bool isFinish = false;

  Future<void> fetchQuestions() async {
    isLoading = true;
    final List<Question> result = [];
    try {
      final res = await _dio.get('https://the-trivia-api.com/v2/questions');
      for (var item in res.data) {
        result.add(Question.fromJson(item));
      }
    } catch (e) {
      //
    }
    questions = result;
    isLoading = false;
  }

  void onAnswer(String yourAnswer, bool isCorrect) {
    questions[currentQuestion].yourAnswer = yourAnswer;
  }

  void onPrev() {
    if (currentQuestion == 0) return;
    currentQuestion--;
  }

  void onNext() {
    if (currentQuestion == questions.length - 1) return;

    currentQuestion++;
  }

  Future<void> onRefresh() async {
    questions.clear();
    currentQuestion = 0;
    isFinish = false;
    await fetchQuestions();
  }

  void onFinish() {
    currentQuestion = 0;
    isFinish = true;
  }
}
