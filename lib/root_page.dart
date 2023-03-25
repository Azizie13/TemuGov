import 'package:flutter/material.dart';
import 'package:temugov_dev/info_pages/lang_select.dart';
import 'package:temugov_dev/main_pages/camera_page.dart';
import 'package:temugov_dev/main_pages/home_page.dart';
import 'package:temugov_dev/main_pages/profile_page.dart';

import 'decoration/background.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key, required this.title});
  final String title;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  List<Widget> pages = const [HomePage(), CameraPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundGradient(),
          child: pages[currentPage]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Pressed float action button");
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LanguageSelectPage()));
        },
        child: const Icon(Icons.add),
      ),
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
