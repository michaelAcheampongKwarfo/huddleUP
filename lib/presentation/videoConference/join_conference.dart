import 'package:flutter/material.dart';
import 'package:huddle_up_project/services/auth_manager.dart';
import 'package:huddle_up_project/services/const.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class JoinConferencePage extends StatelessWidget {
  final String conferenceID;
  final AuthManager _authManager = AuthManager();

  JoinConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: appID,
        appSign: appSign,
        userID: _authManager.user.uid,
        userName: _authManager.user.displayName!,
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          leaveConfirmDialogInfo: ZegoLeaveConfirmDialogInfo(),
        ),
      ),
    );
  }
}
