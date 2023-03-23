import 'package:flutter/material.dart';
import 'package:temugov_dev/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:temugov_dev/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TemuGov App',
      home: AnimatedSplashScreen(
        splash: const Splash(),
        splashIconSize: double.infinity,
        duration: 10000,
        backgroundColor: Colors.deepPurple,
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.topToBottom,
        nextScreen: const HomePage(
          title: 'TemuGov',
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
