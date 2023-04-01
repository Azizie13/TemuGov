import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/main_pages/home/chatbot_page.dart';
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
  List<Widget?> pages = [const HomePage(), null, ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundGradient(),
          child: pages[currentPage]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: kWhite,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "HOME"),
          NavigationDestination(icon: Icon(Icons.camera), label: "CHAT BOT"),
          NavigationDestination(icon: Icon(Icons.person), label: "PROFILE"),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;

            if (index == 1) {
              currentPage = 0;
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatPage()));
            }
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
