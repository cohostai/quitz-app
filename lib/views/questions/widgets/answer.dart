import 'package:flutter/material.dart';
import 'package:quitz_app/theme/text_style.dart';
import 'package:quitz_app/utils/utils.dart';

class Answer extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String? yourAnswer;
  final bool? isCorrect; // null , false, true
  const Answer(
      {super.key,
      required this.label,
      required this.onPressed,
      this.isCorrect,
      this.yourAnswer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        width: Utils.getScreenWidth(context),
        decoration: BoxDecoration(
          color: isCorrect == true
              ? Colors.green
              : isCorrect == false
                  ? Colors.red
                  : Colors.grey.withOpacity(0.1),
          border: yourAnswer == label ? Border.all() : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: AppTextStyle.answer,
        ),
      ),
    );
  }
}
