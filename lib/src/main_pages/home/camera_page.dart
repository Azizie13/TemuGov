import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // padding: const EdgeInsets.all(0.0),
        // margin: const EdgeInsets.all(0.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/lake.jpg"), fit: BoxFit.contain),
        ),
        child: const Center(child: Text('Scan here')));
  }
}
