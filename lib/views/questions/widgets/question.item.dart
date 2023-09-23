import 'package:flutter/material.dart';
import 'package:quitz_app/model/question.dart';
import 'package:quitz_app/theme/text_style.dart';
import 'package:quitz_app/utils/utils.dart';

import 'answer.dart';

class QuestionItem extends StatelessWidget {
  final Question item;
  final Function(String, bool) onAnswerCallback;
  final bool isFinish;
  const QuestionItem(
      {super.key,
      required this.item,
      required this.onAnswerCallback,
      required this.isFinish});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          width: Utils.getScreenWidth(context),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(16)),
          alignment: Alignment.center,
          child: Text(
            item.question ?? '',
            style: AppTextStyle.question,
            textAlign: TextAlign.center,
          ),
        ),
        ...(item.answers?.entries.map((entry) {
              return Answer(
                  label: entry.key,
                  onPressed: () {
                    if (!isFinish) {
                      onAnswerCallback.call(entry.key, entry.value);
                    }
                  },
                  yourAnswer: item.yourAnswer,
                  isCorrect: !isFinish ? null : _getValue(entry.key));
            }).toList() ??
            [])
      ],
    );
  }

  bool? _getValue(_key) {
    if (_key == item.answers?.keys.first) {
      return true;
    } else if (item.yourAnswer == _key) {
      return item.answers?[item.yourAnswer] ?? false;
    } else {
      return null;
    }
  }
}
