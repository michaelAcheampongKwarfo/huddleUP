import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class AppMessage extends StatelessWidget {
  final String text;
  final double size;
  const AppMessage({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(
        10.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: blackColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        color: whiteColor,
      ),
      child: AppText(
        text: text,
        size: size,
        color: blackColor,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
