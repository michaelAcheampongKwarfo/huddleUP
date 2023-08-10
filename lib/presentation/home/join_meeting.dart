import 'package:flutter/material.dart';
import 'package:huddle_up_project/presentation/videoConference/join_conference.dart';
import 'package:huddle_up_project/services/auth_manager.dart';
import 'package:huddle_up_project/services/conference_manager.dart';
import 'package:huddle_up_project/widgets/app_button.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_divider.dart';
import 'package:huddle_up_project/widgets/app_snackbar.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  final AuthManager _authManager = AuthManager();
  final ConferenceManager _conferenceManager = ConferenceManager();
  late TextEditingController _userNameController;
  late TextEditingController _meetingIDController;

  @override
  void initState() {
    _userNameController =
        TextEditingController(text: _authManager.user.displayName);
    _meetingIDController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _meetingIDController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const AppText(
          text: 'Join A Meeting',
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
              child: SizedBox(
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
            ),
            const AppDivider(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _meetingIDController,
                maxLength: 10,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  hintText: 'Meeting ID',
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
            const SizedBox(
              height: 20.0,
            ),
            AppButton(
              text: 'Join Meeting',
              width: MediaQuery.of(context).size.width * 0.7,
              textColor: whiteColor,
              onTap: () {
                if (_userNameController.text == '' ||
                    _meetingIDController.text == '') {
                  AppSnackBar.showSnackBar(
                    context,
                    message: 'All fields required',
                  );
                } else {
                  _conferenceManager.storeJoinMeetingDetails(
                    context,
                    _meetingIDController.text,
                    DateTime.now(),
                  );
                  // ToDo Navigate to Zego Cloud meeting
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => JoinConferencePage(
                        conferenceID: _meetingIDController.text,
                      ),
                    ),
                  );
                  // ToDo Store the meeting details to firestore
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
