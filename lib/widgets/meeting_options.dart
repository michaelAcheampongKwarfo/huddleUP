import 'package:flutter/material.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_text.dart';

class MeetingOptions extends StatefulWidget {
  final String text;
  final VoidCallback onchanged;
  const MeetingOptions({
    super.key,
    required this.text,
    required this.onchanged,
  });

  @override
  State<MeetingOptions> createState() => _MeetingOptionsState();
}

class _MeetingOptionsState extends State<MeetingOptions> {
  @override
  Widget build(BuildContext context) {
    bool isMeetingOptionOn = false;
    void toggleMeetingOption(bool value) {
      setState(() {
        isMeetingOptionOn = value;
      });
    }

    return Container(
      width: MediaQuery.of(context).size.width * 9,
      padding: const EdgeInsets.all(
        10.0,
      ),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: blackColor,
            width: 1.5,
          ),
        ),
        color: whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: widget.text,
            size: 15.0,
            color: blackColor,
            fontWeight: FontWeight.normal,
          ),
          Switch(
            value: isMeetingOptionOn,
            onChanged: toggleMeetingOption,
          ),
        ],
      ),
    );
  }
}
