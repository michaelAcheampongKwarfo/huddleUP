import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_message.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const AppText(
          text: 'History',
          size: 20.0,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: purpleColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('meeting_details')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: AppMessage(
                  text: 'Failed to retrieve meeting history: ${snapshot.error}',
                  size: 15.0),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String title = data['title'];
              String roomID = data['roomID'];
              DateTime date = data['date'].toDate();

              return ListTile(
                contentPadding: const EdgeInsets.all(
                  10.0,
                ),
                tileColor: whiteColor,
                title: AppText(
                  text: title,
                  size: 16.0,
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: AppText(
                  text: roomID,
                  size: 14.0,
                  color: blackColor,
                  fontWeight: FontWeight.normal,
                ),
                trailing: AppText(
                  text: date.toString(),
                  size: 14.0,
                  color: blackColor,
                  fontWeight: FontWeight.normal,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
