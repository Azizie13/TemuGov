import 'dart:ui';
import 'package:flutter/material.dart';

class OverlayWidget extends StatelessWidget {
  final Widget child;

  const OverlayWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.blue.withOpacity(0.5),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
