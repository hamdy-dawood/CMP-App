import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class AppFunctions {
  static void showsToast(String text,Color color, BuildContext context,
      {int seconds = 5}){
    showToast(text,
      context: context,
      backgroundColor: color,
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideToTopFade,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 2),
      duration: Duration(seconds: seconds),
      curve: Curves.elasticOut,
      reverseCurve: Curves.easeInOutCirc,
    );
  }
}