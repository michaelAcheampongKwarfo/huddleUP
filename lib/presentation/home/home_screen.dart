import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_message.dart';
import 'package:huddle_up_project/widgets/app_text.dart';
import 'package:huddle_up_project/widgets/home_contents.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const AppText(
          text: 'Home',
          size: 20.0,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            HomeContent(
              onTap1: () {
                Navigator.of(context).pushNamed(
                  '/startMeeting',
                );
              },
              onTap2: () {
                Navigator.of(context).pushNamed(
                  '/joinMeeting',
                );
              },
              onTap3: () {
                Navigator.of(context).pushNamed(
                  '/scheduleMeeting',
                );
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              thickness: 3.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Expanded(
              child: Center(
                child: AppMessage(
                  text: 'Start / Join a meeting with just a click !',
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
