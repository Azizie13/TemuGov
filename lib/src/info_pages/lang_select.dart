import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/info_pages/info_page.dart';
import 'package:temugov_dev/src/size_config.dart';

import '../decoration/background.dart';

class LanguageSelectPage extends StatelessWidget {
  const LanguageSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget welcomeText = Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: kOpenSansBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 10),
            ),
            Text(
              " Let's Get Started",
              style: kOpenSansRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 5),
            ),
          ],
        ));

    Widget languageElevatedButtons = Column(
      children: [
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            _buildButton("ENGLISH", () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => InfoPage()));
            }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/lang/UK.png',
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            _buildButton("MALAY", () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => InfoPage()));
            }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/lang/MY.png',
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        _buildButton("MORE...", () {})
      ],
    );

    Widget selector = Container(
        width: SizeConfig.blockSizeHorizontal! * 95,
        height: SizeConfig.blockSizeVertical! * 61,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeText,
              const SizedBox(height: 70, width: double.infinity),
              Align(
                  alignment: Alignment.center,
                  child: Text("Select Language",
                      style: kOpenSansBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 7))),
              languageElevatedButtons,
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
              Image(
                image: const AssetImage("assets/images/logo.png"),
                height: SizeConfig.blockSizeVertical! * 30,
                width: SizeConfig.blockSizeHorizontal! * 70,
              ),
              selector,
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildButton(String text, Null Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(kPurple),
          overlayColor: const MaterialStatePropertyAll(kGreyButton),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          fixedSize: MaterialStatePropertyAll<Size>(Size(
              SizeConfig.blockSizeHorizontal! * 90,
              SizeConfig.blockSizeVertical! * 7.5))),
      child: Text(
        text,
        style: kOpenSansRegular.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * 6, color: kWhite),
      ),
    );
  }
}
