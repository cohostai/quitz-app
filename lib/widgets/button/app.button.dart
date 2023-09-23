import 'package:flutter/material.dart';
import 'package:quitz_app/theme/text_style.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color bgColor;
  const AppButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.bgColor = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTextStyle.button,
        ),
      ),
    );
  }
}
