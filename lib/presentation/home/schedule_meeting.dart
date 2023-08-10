import 'package:flutter/material.dart';
import 'package:huddle_up_project/services/auth_manager.dart';
import 'package:huddle_up_project/services/conference_manager.dart';
import 'package:huddle_up_project/widgets/app_button.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_divider.dart';
import 'package:huddle_up_project/widgets/app_snackbar.dart';
import 'package:huddle_up_project/widgets/app_text.dart';
import 'dart:math';

class ScheduleMeetingScreen extends StatefulWidget {
  const ScheduleMeetingScreen({super.key});

  @override
  State<ScheduleMeetingScreen> createState() => _ScheduleMeetingScreenState();
}

class _ScheduleMeetingScreenState extends State<ScheduleMeetingScreen> {
  final AuthManager _authManager = AuthManager();
  final ConferenceManager _conferenceManager = ConferenceManager();
  late TextEditingController _titleController;
  late TextEditingController _userNameController;
  String randomMeetingID = (Random().nextInt(100000000) + 999999999).toString();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _userNameController =
        TextEditingController(text: _authManager.user.displayName);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const AppText(
          text: 'Schedule A Meeting',
          size: 20.0,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: transparentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: blackColor,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppText(
                      text: 'Your Meeting ID',
                      size: 14.0,
                      color: blackColor,
                      fontWeight: FontWeight.normal,
                    ),
                    AppText(
                      text: randomMeetingID,
                      size: 14.0,
                      color: blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            const AppDivider(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _userNameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  hintText: 'Your name for this meeting',
                  hintStyle: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Times New Roman',
                  ),
                  filled: true,
                  fillColor: whiteColor,
                ),
              ),
            ),
            const AppDivider(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _titleController,
                maxLength: 25,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  hintText: 'Title for this meeting',
                  hintStyle: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Times New Roman',
                  ),
                  filled: true,
                  fillColor: whiteColor,
                ),
              ),
            ),
            //ToDo  Add the date time picker
            const SizedBox(
              height: 20.0,
            ),
            AppButton(
              text: 'Done',
              width: MediaQuery.of(context).size.width * 0.7,
              textColor: whiteColor,
              onTap: () {
                if (_userNameController.text == '' ||
                    _titleController.text == '') {
                  AppSnackBar.showSnackBar(
                    context,
                    message: 'All fields required',
                  );
                } else {
                  _conferenceManager.storeScheduleMeetingDetails(
                    context,
                    _titleController.text,
                    randomMeetingID,
                    DateTime.now(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
