// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:huddle_up_project/services/auth_manager.dart';
import 'package:huddle_up_project/widgets/app_button.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class AppBottomSheet {
  static void showBottomSheet(
    BuildContext context, {
    required String message,
    required String text,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(
            15.0,
          ),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              AppText(
                text: text,
                size: 18.0,
                color: blackColor,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 15.0,
              ),
              AppText(
                text: message,
                size: 15.0,
                color: blackColor,
                fontWeight: FontWeight.normal,
              ),
              const SizedBox(
                height: 10.0,
              ),
              AppButton(
                text: 'Dismiss',
                width: MediaQuery.of(context).size.width * 0.9,
                textColor: whiteColor,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        );
      },
    );
  }

  static void showLogOutBottomSheet(BuildContext context,
      {required String message}) {
    final AuthManager authManager = AuthManager();
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(
            15.0,
          ),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              AppText(
                text: message,
                size: 15.0,
                color: blackColor,
                fontWeight: FontWeight.normal,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      // log out from the app
                      await authManager.signOut(context);
                      Navigator.of(context).pushNamed(
                        '/welcome',
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: blackColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        color: purpleColor,
                      ),
                      child: const AppText(
                        text: 'Confirm',
                        size: 18.0,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: blackColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        color: whiteColor,
                      ),
                      child: const AppText(
                          text: 'Cancel',
                          size: 18.0,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
