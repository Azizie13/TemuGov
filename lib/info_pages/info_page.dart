import 'package:flutter/material.dart';

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
          // First Page
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'First Page',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          // Second Page
          Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                'Second Page',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
        onPageChanged: (pageIndex) => {
          if (pageIndex == _lastPageIndex)
            {
              //Navigate to a new page
            }
        },
      ),
      floatingActionButton: FloatingActionButton(
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
          child: const Icon(Icons.arrow_forward_ios_rounded)),
    );
  }
}
