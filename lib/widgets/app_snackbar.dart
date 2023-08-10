import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class AppSnackBar {
  static void showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(
          seconds: 5,
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(
          15.0,
        ),
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        content: AppText(
          text: message,
          size: 15.0,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
