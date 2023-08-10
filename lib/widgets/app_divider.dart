import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        Divider(
          thickness: 3.0,
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
