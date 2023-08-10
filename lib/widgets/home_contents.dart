import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_button.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class HomeContent extends StatelessWidget {
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;
  const HomeContent({
    super.key,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: blackColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              color: deepGreyColor,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: 'New Conference',
                    size: 18.0,
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 08.0,
                  ),
                  const AppText(
                    text: 'Ready to start your meeting',
                    size: 14.0,
                    color: whiteColor,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(
                    height: 08.0,
                  ),
                  AppButton(
                    text: 'Get started',
                    width: MediaQuery.of(context).size.width * 0.5,
                    textColor: whiteColor,
                    onTap: onTap1,
                  ),
                ]),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: onTap2,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.42,
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
                    color: purpleColor,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.video_call_rounded,
                        size: 35.0,
                        color: whiteColor,
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      AppText(
                        text: 'Join Meeting',
                        size: 14.0,
                        color: whiteColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: onTap3,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.42,
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
                    color: purpleColor,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 35.0,
                        color: whiteColor,
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      AppText(
                        text: 'Schedule Meeting',
                        size: 14.0,
                        color: whiteColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
