import 'package:flutter/material.dart';
import 'package:temugov_dev/app_styles.dart';
import 'package:temugov_dev/size_config.dart';

import '../decoration/background.dart';

class LanguageSelectPage extends StatelessWidget {
  const LanguageSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget Selector = Container(
        width: 355,
        height: 489,
        padding: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(children: const [
          Text("Welcome"),
        ]));

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundGradient(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("assets/images/logo.png"),
                height: 255,
                width: 264,
              ),
              Selector,
            ],
          ),
        ),
      ),
    );
  }
}
