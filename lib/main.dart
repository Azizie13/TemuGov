import 'package:flutter/material.dart';
import 'package:temugov_dev/src/info_pages/lang_select.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:temugov_dev/src/splash.dart';
import 'package:temugov_dev/src/decoration/background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TemuGov App',
      home: Container(
        decoration: backgroundGradient(),
        child: animation(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    );
  }

  AnimatedSplashScreen animation() {
    return AnimatedSplashScreen(
      splash: const Splash(),
      splashIconSize: double.infinity,
      duration: 2000,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.topToBottom,
      nextScreen: const LanguageSelectPage(),
    );
  }
}
