import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double width;
  final Color textColor;
  final VoidCallback onTap;
  const AppButton({
    super.key,
    required this.text,
    required this.width,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(
          10.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: blackColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          color: purpleColor,
        ),
        child: AppText(
          text: text,
          size: 18.0,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
