// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:huddle_up_project/services/auth_manager.dart';
import 'package:huddle_up_project/widgets/app_button.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AuthManager _authManager = AuthManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const AppText(
              text:
                  'Welcome to Huddle Up - One app for team chat, phone meetings, and more .',
              size: 18.0,
              color: blackColor,
              fontWeight: FontWeight.normal,
            ),
            const Spacer(),
            Image.asset(
              'lib/images/applogo.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const Spacer(),
            AppButton(
              text: 'Get Started',
              width: MediaQuery.of(context).size.width * 0.7,
              textColor: whiteColor,
              onTap: () async {
                await _authManager.signInWithGoogle(context);
                Navigator.of(context).pushNamed(
                  '/navbar',
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
