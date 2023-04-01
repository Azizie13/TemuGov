import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';
import 'package:temugov_dev/src/root_page.dart';
import 'package:temugov_dev/src/size_config.dart';

class PermissionPage extends StatelessWidget {
  PermissionPage({super.key});

  final PageController _pageController = PageController(initialPage: 0);
  final int _lastPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const ScrollPhysics(),
        children: [
          firstPage(context),
          secondPage(context),
        ],
        onPageChanged: (pageIndex) => {
          if (pageIndex == _lastPageIndex)
            {
              //Do nothing for now
            }
        },
      ),
    );
  }

  Widget firstPage(BuildContext context) {
    Widget pageNotch = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kPurple,
          ),
        ),
        const SizedBox(width: 30),
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kWhite,
          ),
        ),
      ],
    );

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: backgroundGradient(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PERMISSION",
              style: kMontExtraBold.copyWith(fontSize: 48),
            ),
            const SizedBox(
              height: 28,
            ),
            Image.asset(
              "assets/images/Perm1.png",
              height: 250,
              width: 250,
            ),
            Container(margin: const EdgeInsets.all(25.0), child: pageNotch),
            Container(
              margin: const EdgeInsets.all(25.0),
              child: Text(
                "Location Services",
                style: kMontExtraBold.copyWith(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Text(
                "TemuGOV will need to\nenable the location\nservices",
                style: kMontMedium.copyWith(fontSize: 19),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 25, bottom: 10.0),
                child: _buildButton("Turn On Location", () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => RootPage()));
                })),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => RootPage()));
                },
                child: Text(
                  "Skip for now",
                  style: kMontExtraBold.copyWith(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5),
                ))
          ],
        ),
      ),
    );
  }

  Widget secondPage(BuildContext context) {
    Widget pageNotch = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kWhite,
          ),
        ),
        const SizedBox(width: 30),
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kPurple,
          ),
        ),
      ],
    );

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: backgroundGradient(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PERMISSION",
              style: kMontExtraBold.copyWith(fontSize: 48),
            ),
            const SizedBox(
              height: 28,
            ),
            Image.asset(
              "assets/images/Perm2.png",
              height: 250,
              width: 250,
            ),
            Container(margin: const EdgeInsets.all(25.0), child: pageNotch),
            Container(
              margin: const EdgeInsets.all(25.0),
              child: Text(
                "Notifications",
                style: kMontExtraBold.copyWith(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Text(
                "With push notifications we will inform\nyou about your nearest appointment",
                style: kMontMedium.copyWith(fontSize: 19),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 25, bottom: 10.0),
                child: _buildButton("Turn On Notification", () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => RootPage()));
                })),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => RootPage()));
                },
                child: Text(
                  "Skip for now",
                  style: kMontExtraBold.copyWith(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5),
                ))
          ],
        ),
      ),
    );
    ;
  }

  ElevatedButton _buildButton(String text, Null Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(kPurple),
          overlayColor: const MaterialStatePropertyAll(kGreyButton),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          fixedSize: MaterialStatePropertyAll<Size>(Size(
              SizeConfig.blockSizeHorizontal! * 80,
              SizeConfig.blockSizeVertical! * 7.5))),
      child: Text(
        text,
        style: kMontExtraBold.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * 6, color: kWhite),
      ),
    );
  }
}
