import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';
import 'package:temugov_dev/src/decoration/overlay_widget.dart';
import 'package:temugov_dev/src/main_pages/guest/home_page_guest.dart';
import 'package:temugov_dev/src/main_pages/home/chatbot_page.dart';
import 'package:temugov_dev/src/main_pages/home/home_page.dart';
import 'package:temugov_dev/src/main_pages/home/profile_page.dart';

class RootPageGuest extends StatefulWidget {
  const RootPageGuest({super.key});

  @override
  State<RootPageGuest> createState() => _RootPageGuestState();
}

class _RootPageGuestState extends State<RootPageGuest> {
  int currentPage = 0;
  bool isGuest = true;

  List<Widget?> pages = [const HomePageGuest(), null, null];

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
            currentPage = 0;
            debugPrint('$isGuest');

            if (isGuest == true) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return OverlayWidget(
                    child: Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Please sign up to unlock this feature.',
                          style: kMontMedium.copyWith(
                            fontSize: 20,
                            color: kWhite,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  );
                },
              ));
            }
          });
        },
        selectedIndex: 0,
      ),
    );
  }
}
