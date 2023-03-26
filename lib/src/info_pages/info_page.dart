import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class InfoPage extends StatelessWidget {
  InfoPage({super.key});

  final PageController _pageController = PageController(initialPage: 0);
  final int _lastPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: [
          firstPage(),
          secondPage(),
        ],
        onPageChanged: (pageIndex) => {
          if (pageIndex == _lastPageIndex)
            {
              //Navigate to a new page
            }
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPurple,
          foregroundColor: kWhite,
          onPressed: () {
            if (_pageController.page == _lastPageIndex) {
              //Navigate to a new page
            } else {
              // Simulate a swipe to the next page
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            }
          },
          child: const Icon(Icons.arrow_forward_sharp)),
    );
  }

  Widget firstPage() {
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

    Widget imageStack = Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -250,
          child: Container(
            height: 500,
            width: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/CircleDecoration.png"),
                  opacity: 0.09),
              shape: BoxShape.circle,
              color: kPurple,
            ),
          ),
        ),
        const Positioned(
          top: -30,
          child: Image(
            image: AssetImage("assets/images/Info1.png"),
            height: 520,
            width: 505,
          ),
        ),
        pageNotch,
        Positioned(
          top: 450,
          child: SizedBox(
            width: 300,
            height: 230,
            child: Text(
              "Make your own \nappointment \nschedule with\ngovernment\nservices\nmore flexible",
              style: kMontExtraBold.copyWith(fontSize: 30),
            ),
          ),
        ),
      ],
    );

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: backgroundGradient(),
      child: imageStack,
    );
  }

  Widget secondPage() {
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

    Widget imageStack = Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -250,
          child: Container(
            height: 500,
            width: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/CircleDecoration.png"),
                  opacity: 0.09),
              shape: BoxShape.circle,
              color: kPurple,
            ),
          ),
        ),
        const Positioned(
          top: 20,
          child: Image(
            image: AssetImage("assets/images/Info2.png"),
            height: 394,
            width: 375,
          ),
        ),
        pageNotch,
        Positioned(
          top: 470,
          child: SizedBox(
            width: 300,
            height: 230,
            child: Text(
              "Interact with\nvarious government\nservices in one\nplatform",
              style: kMontExtraBold.copyWith(fontSize: 30),
            ),
          ),
        ),
      ],
    );

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: backgroundGradient(),
      child: imageStack,
    );
  }
}
