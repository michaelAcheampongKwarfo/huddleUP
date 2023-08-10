import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class UserInfo extends StatelessWidget {
  final String userName;
  final String email;
  final String photoURL;
  const UserInfo({
    super.key,
    required this.userName,
    required this.email,
    required this.photoURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(10.0),
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
      child: Column(
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundColor: deepGreyColor,
            child: ClipOval(
              child: Image.network(
                photoURL,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                text: 'User Name :',
                size: 14.0,
                color: blackColor,
                fontWeight: FontWeight.normal,
              ),
              AppText(
                text: userName,
                size: 14.0,
                color: blackColor,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
          const SizedBox(
            height: 08.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                text: 'Email :',
                size: 14.0,
                color: blackColor,
                fontWeight: FontWeight.normal,
              ),
              AppText(
                text: email,
                size: 14.0,
                color: blackColor,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
