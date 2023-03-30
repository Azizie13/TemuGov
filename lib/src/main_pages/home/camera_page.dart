import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: kPurple,
          title: const Text(
            "Camera",
          ),
          titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
          foregroundColor: kWhite,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 150),
            child: Image.asset('assets/images/Camera.png')),
      ],
    );
  }
}
