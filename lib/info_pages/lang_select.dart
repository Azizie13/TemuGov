import 'package:flutter/material.dart';

import '../decoration/background.dart';

class LanguageSelectPage extends StatelessWidget {
  const LanguageSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundGradient(),
        child: const Text("Test"),
      ),
    );
  }
}
