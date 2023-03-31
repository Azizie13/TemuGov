import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<Item> _items = <Item>[
    Item(
      question: 'What is TemuGOV?',
      answer:
          'Flutter is a mobile app SDK for building high-performance, high-fidelity, apps for iOS, Android, web, and desktop from a single codebase.',
    ),
    Item(
      question: 'What are the advantages of using TemuGOV?',
      answer:
          'Some advantages of using Flutter are: fast development, expressive and flexible UI, native performance, and a single codebase for multiple platforms.',
    ),
    Item(
      question: 'Is TemuGOV free?',
      answer:
          'Yes, Flutter is an open-source framework and is free to use, even for commercial projects.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kPurple,
        title: const Text(
          "FAQ",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _items[index].isExpanded = !isExpanded;
              });
            },
            children: _items.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.question),
                  );
                },
                body: ListTile(
                  title: Text(item.answer),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Item {
  Item({required this.question, required this.answer, this.isExpanded = false});

  String question;
  String answer;
  bool isExpanded;
}
