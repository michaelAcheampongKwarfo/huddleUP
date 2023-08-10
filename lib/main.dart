import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:huddle_up_project/firebase_options.dart';
import 'package:huddle_up_project/presentation/home/join_meeting.dart';
import 'package:huddle_up_project/presentation/home/schedule_meeting.dart';
import 'package:huddle_up_project/presentation/home/start_meeting.dart';
import 'package:huddle_up_project/presentation/nav_bar.dart';
import 'package:huddle_up_project/presentation/welcome_screen.dart';
import 'package:huddle_up_project/services/auth_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huddle Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: AuthManager().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const NavBarScreen();
          }
          return const WelcomeScreen();
        },
      ),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/navbar': (context) => const NavBarScreen(),
        '/startMeeting': (context) => const StartMeetingScreen(),
        '/joinMeeting': (context) => const JoinMeetingScreen(),
        '/scheduleMeeting': (context) => const ScheduleMeetingScreen()
      },
    );
  }
}
