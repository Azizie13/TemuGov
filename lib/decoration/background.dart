import 'package:flutter/material.dart';

BoxDecoration backgroundGradient() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white,
        Colors.lightBlue,
      ],
    ),
  );
}
