import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class PermissionPage extends StatelessWidget {
  PermissionPage({super.key});

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
    );
  }

  Widget firstPage() {
    return Container();
  }

  Widget secondPage() {
    return Container();
  }
}
