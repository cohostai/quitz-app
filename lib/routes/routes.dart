import 'package:flutter/material.dart';
import 'package:quitz_app/views/questions/questions.view.dart';
import 'package:quitz_app/views/splash/splash.view.dart';

class AppRoutes {
  AppRoutes._();

  static String get splashView => 'splash-view';
  static String get questionsView => 'questions-view';

  static Map<String, Widget Function(BuildContext)> routes = {
    splashView: (context) => const SplashView(),
    questionsView: (context) => const QuestionsView()
  };
}
