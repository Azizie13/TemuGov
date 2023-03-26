import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';

BoxDecoration backgroundGradient() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        kGradient1,
        kGradient2,
      ],
    ),
  );
}
