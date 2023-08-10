import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_snackbar.dart';

class ConferenceManager {
  // function to store meeting details when the user start a meeting
  void storeStartMeetingDetails(
    BuildContext context,
    String title,
    String roomID,
    DateTime date,
  ) {
    FirebaseFirestore.instance
        .collection('meeting_details')
        .add({
          'title': title,
          'roomID': roomID,
          'date': date,
        })
        .then((value) => AppSnackBar.showSnackBar(context,
            message: 'Your Meeting details has been stored successfully'))
        .catchError((error) => AppSnackBar.showSnackBar(context,
            message: 'Failed to store user details: $error'));
  }

  // function to store meeting details when the user joins a meeting
  void storeJoinMeetingDetails(
    BuildContext context,
    String roomID,
    DateTime date,
  ) {
    FirebaseFirestore.instance
        .collection('meeting_details')
        .add({
          'roomID': roomID,
          'date': date,
        })
        .then((value) => AppSnackBar.showSnackBar(context,
            message: 'Your Meeting details has been stored successfully'))
        .catchError((error) => AppSnackBar.showSnackBar(context,
            message: 'Failed to store user details: $error'));
  }

  // function to store meeting details when the user start a meeting
  void storeScheduleMeetingDetails(
    BuildContext context,
    String title,
    String roomID,
    DateTime date,
  ) {
    FirebaseFirestore.instance
        .collection('meeting_details')
        .add({
          'title': title,
          'roomID': roomID,
          'date': date,
        })
        .then((value) => AppSnackBar.showSnackBar(context,
            message: 'Your Meeting details has been Scheduled successfully'))
        .catchError((error) => AppSnackBar.showSnackBar(context,
            message: 'Failed to store user details: $error'));
  }
}
