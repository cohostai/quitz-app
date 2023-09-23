import 'package:flutter/material.dart';
import 'package:quitz_app/controller/question.controller.dart';
import 'package:quitz_app/theme/text_style.dart';
import 'package:quitz_app/utils/utils.dart';
import 'package:quitz_app/views/questions/widgets/question.action.dart';
import 'package:quitz_app/views/questions/widgets/question.item.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  final QuestionController _controller = QuestionController();
  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await _controller.fetchQuestions();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Questions', style: AppTextStyle.title.copyWith(fontSize: 24)),
        backgroundColor: Colors.amberAccent,
      ),
      body: _controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 13),
                QuestionItem(
                  item: _controller.questions[_controller.currentQuestion],
                  onAnswerCallback: (String yourAnswer, bool isCorrect) {
                    _controller.onAnswer(yourAnswer, isCorrect);
                    setState(() {});
                  },
                  isFinish: _controller.isFinish,
                ),
                QuestionAction(
                  currentQuestion: _controller.currentQuestion + 1,
                  isLast: _controller.currentQuestion + 1 ==
                      _controller.questions.length,
                  onNext: () {
                    _controller.onNext();
                    setState(() {});
                  },
                  onPrev: () {
                    _controller.onPrev();
                    setState(() {});
                  },
                  totalQuestion: _controller.questions.length,
                  onFinish: () {
                    _controller.onFinish();
                    setState(() {});
                  },
                  onRefresh: () async {
                    await _controller.onRefresh();
                    setState(() {});
                  },
                )
              ],
            ),
    );
  }
}
