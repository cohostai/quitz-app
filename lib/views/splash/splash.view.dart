import 'package:flutter/material.dart';
import 'package:quitz_app/routes/routes.dart';
import 'package:quitz_app/theme/text_style.dart';
import 'package:quitz_app/utils/utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await Future.delayed(const Duration(seconds: 2)).whenComplete(() =>
          Navigator.pushReplacementNamed(context, AppRoutes.questionsView));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Text(
          'Quitz App',
          style: AppTextStyle.title,
        ),
      ),
    );
  }
}
