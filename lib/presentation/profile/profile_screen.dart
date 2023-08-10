import 'package:flutter/material.dart';
import 'package:huddle_up_project/services/app_info.dart';
import 'package:huddle_up_project/services/auth_manager.dart';
import 'package:huddle_up_project/widgets/app_bottomsheet.dart';
import 'package:huddle_up_project/widgets/app_colors.dart';
import 'package:huddle_up_project/widgets/app_message.dart';
import 'package:huddle_up_project/widgets/app_text.dart';
import 'package:huddle_up_project/widgets/profile_button.dart';
import 'package:huddle_up_project/widgets/user_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthManager _authManager = AuthManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const AppText(
          text: 'Profile',
          size: 20.0,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: purpleColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          UserInfo(
            userName: _authManager.user.displayName!,
            email: _authManager.user.email!,
            photoURL: _authManager.user.photoURL!,
          ),
          ProfileButton(
            icon: Icons.perm_device_information_outlined,
            text: 'Version',
            onTap: () {
              AppBottomSheet.showBottomSheet(
                context,
                text: 'Version Statement',
                message: versionStatement,
              );
            },
          ),
          ProfileButton(
            icon: Icons.info_outline,
            text: 'About Us',
            onTap: () {
              AppBottomSheet.showBottomSheet(
                context,
                text: 'About Us Statement',
                message: aboutUsStatement,
              );
            },
          ),
          ProfileButton(
            icon: Icons.lock_outline,
            text: 'Privacy Policy',
            onTap: () {
              AppBottomSheet.showBottomSheet(
                context,
                text: 'Privacy Policy Statement',
                message: privacyPolicyStatement,
              );
            },
          ),
          ProfileButton(
            icon: Icons.gavel_outlined,
            text: 'Terms Of Services',
            onTap: () {
              AppBottomSheet.showBottomSheet(
                context,
                text: 'Terms Of Services Statement',
                message: termsOfServicesStatement,
              );
            },
          ),
          ProfileButton(
            icon: Icons.groups_3_outlined,
            text: 'Community Standard',
            onTap: () {
              AppBottomSheet.showBottomSheet(
                context,
                text: 'Community Standard Statement',
                message: communityStandardStatement,
              );
            },
          ),
          ProfileButton(
            icon: Icons.code_outlined,
            text: 'Open Source SoftWare',
            onTap: () {
              AppBottomSheet.showBottomSheet(
                context,
                text: 'Open Source Statement',
                message: openSourceStatement,
              );
            },
          ),
          ProfileButton(
            icon: Icons.contact_page_outlined,
            text: 'Contact Us',
            onTap: () {
              AppBottomSheet.showBottomSheet(
                context,
                text: 'Contact Us Statement',
                message: contactUsStatement,
              );
            },
          ),
          ProfileButton(
            icon: Icons.logout_outlined,
            text: 'Log Out',
            onTap: () {
              AppBottomSheet.showLogOutBottomSheet(
                context,
                message: logOutStatement,
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
          const AppMessage(
            text: 'Copyright ©️ 2022-2023 Huddle Up .\n All rights reserved .',
            size: 14.0,
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
