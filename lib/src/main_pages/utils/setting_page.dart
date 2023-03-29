import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kPurple,
        title: const Text(
          "Settings",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundGradient(),
          child: SafeArea(child: _buildSettings())),
    );
  }

  final List<String> settingsNames = [
    "Change my TemuGOV ID",
    "Change my Password",
    "Change Language",
    "Privacy Policy",
    "Advanced Settings",
    "Sign Out"
  ];
  final List<IconData> settingsIcons = [
    Icons.supervised_user_circle,
    Icons.key_rounded,
    Icons.map_rounded,
    Icons.privacy_tip_rounded,
    Icons.settings,
    Icons.key_off_rounded
  ];

  ListView _buildSettings() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(4, 4),
              ),
            ], color: kWhite, borderRadius: BorderRadius.circular(8.0)),
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 38, vertical: 30),
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
            child: Row(
              children: [
                Icon(settingsIcons[index], size: 40.0),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  settingsNames[index],
                  style: kOpenSansSemiBold.copyWith(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        });
  }
}
