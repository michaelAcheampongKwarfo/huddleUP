import 'package:flutter/material.dart';
import 'package:huddle_up_project/presentation/history/history_screen.dart';
import 'package:huddle_up_project/presentation/home/home_screen.dart';
import 'package:huddle_up_project/presentation/profile/profile_screen.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentIndex = 0;
  final List<Widget> _pageList = [
    const HomeScreen(),
    const HistoryScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: whiteColor,
          selectedItemColor: purpleColor,
          unselectedItemColor: deepGreyColor,
          unselectedFontSize: 14.0,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ]),
    );
  }
}
