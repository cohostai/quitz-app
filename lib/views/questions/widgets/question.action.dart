import 'package:flutter/material.dart';
import 'package:quitz_app/theme/text_style.dart';
import 'package:quitz_app/widgets/button/app.button.dart';

class QuestionAction extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestion;
  final bool isLast;
  final VoidCallback onPrev, onNext, onRefresh, onFinish;
  const QuestionAction(
      {super.key,
      required this.currentQuestion,
      required this.totalQuestion,
      required this.onPrev,
      required this.onNext,
      required this.isLast,
      required this.onRefresh,
      required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
              flex: 2,
              child: AppButton(
                label: isLast ? 'Refresh' : 'Prev',
                onPressed: () {
                  if (isLast) {
                    onRefresh.call();
                  } else {
                    onPrev.call();
                  }
                },
              )),
          const SizedBox(width: 16),
          Text(
            '$currentQuestion/$totalQuestion',
            style: AppTextStyle.answer,
          ),
          const SizedBox(width: 16),
          Expanded(
              flex: 2,
              child: AppButton(
                label: isLast ? 'Finish' : 'Next',
                onPressed: () {
                  if (isLast) {
                    onFinish.call();
                  } else {
                    onNext.call();
                  }
                },
                bgColor: Colors.blue,
              )),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
