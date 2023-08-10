import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const ProfileButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        const Divider(
          thickness: 3.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            padding: const EdgeInsets.all(
              10.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: purpleColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(
                12.0,
              ),
              color: whiteColor,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 35.0,
                  color: purpleColor,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                AppText(
                  text: text,
                  size: 18.0,
                  color: blackColor,
                  fontWeight: FontWeight.normal,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_right_rounded,
                  color: purpleColor,
                  size: 35.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
