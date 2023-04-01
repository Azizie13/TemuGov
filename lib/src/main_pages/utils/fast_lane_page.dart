import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class FastLanePage extends StatelessWidget {
  const FastLanePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kPurple,
        title: const Text(
          "Fast Lane",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundGradient(),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 270,
          height: 340,
          margin: const EdgeInsets.symmetric(vertical: 28, horizontal: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              image: const DecorationImage(
                  image: AssetImage('assets/images/price.png'),
                  fit: BoxFit.cover)),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kLightPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(270, 50),
            ),
            onPressed: () {},
            child: Text(
              'Purchase',
              style: kMontBold.copyWith(fontSize: 24, color: kWhite),
            )),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Text(
            "Experience fast processing times for selected services",
            style: kMontSemiBold.copyWith(fontSize: 14),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            "Permit Renewal\nVisa Application\nPassport Renewal",
            style: kMontExtraBold.copyWith(fontSize: 14),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              Text(
                "with our exclusive ",
                style: kMontSemiBold.copyWith(fontSize: 14),
              ),
              Text(
                "Fast lane feature!",
                style: kMontExtraBold.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
