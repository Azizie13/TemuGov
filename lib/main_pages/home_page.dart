import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildIcon(IconData icon, String text, void Function()? onPressed) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.black,
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(icon),
                color: Colors.white,
                iconSize: 35,
              ),
            ),
          ),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      height: double.infinity,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIcon(
                Icons.calendar_month_sharp, "     Manage\nAppointments", () {}),
            _buildIcon(Icons.question_mark_sharp, "FAQ", () {}),
            _buildIcon(Icons.chat, "HelperBot", () {}),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIcon(Icons.supervisor_account, "HelperBot", () {}),
            _buildIcon(Icons.settings, "Settings", () {}),
            _buildIcon(Icons.more_horiz_sharp, "More", () {})
          ],
        ),
      ]),
    );
  }
}
