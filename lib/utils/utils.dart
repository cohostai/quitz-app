import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static void onWidgetBuildDone(Function callBack) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await callBack.call();
    });
  }

  static double getScreenWidth(insContext) =>
      MediaQuery.sizeOf(insContext).width;
}
