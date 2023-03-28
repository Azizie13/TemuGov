import 'package:flutter/material.dart';
import 'package:temugov_dev/src/main_pages/home/camera_page.dart';
import 'package:temugov_dev/src/main_pages/home/home_page.dart';
import 'package:temugov_dev/src/main_pages/home/profile_page.dart';

import 'decoration/background.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [HomePage(), CameraPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundGradient(),
          child: pages[currentPage]),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "HOME"),
          NavigationDestination(icon: Icon(Icons.camera), label: "CAMERA"),
          NavigationDestination(icon: Icon(Icons.person), label: "PROFILE"),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
            debugPrint("Current page is set to $currentPage");
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
