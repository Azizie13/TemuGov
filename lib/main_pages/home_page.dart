import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      margin: const EdgeInsets.all(5.0),
      height: 200,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month_sharp),
              iconSize: 50,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.question_mark_sharp),
                iconSize: 50),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.chat), iconSize: 50),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.supervised_user_circle),
              iconSize: 50,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                iconSize: 50),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz_sharp),
                iconSize: 50),
          ],
        ),
      ]),
    );
  }
}
