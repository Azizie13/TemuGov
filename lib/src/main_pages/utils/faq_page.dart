import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

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
          "TemuGOV is an all-in-one appointment making app for government services. With TemuGOV, you can easily schedule appointments for a wide range of government services, all from one convenient platform. Whether you need to renew your passport, apply for a driver's license, or schedule a meeting with a government official, TemuGOV makes it easy and convenient to get the services you need. Say goodbye to long lines, and hello to the future of government service!",
    ),
    Item(
      question: 'What are the advantages of using TemuGOV?',
      answer:
          "TemuGov offers a number of advantages for users who need to access government services:\n\nConvenience: With TemuGov, you can schedule appointments for a wide range of government services from one centralized platform, saving you time and hassle.\n\n...",
    ),
    Item(
      question: 'Is TemuGOV free?',
      answer:
          'While most features of TemuGOV are free to use, there are some features that require an in-app purchase, such as the Fast Queue feature. So while the app itself is free to download and use, some of its more advanced features may require payment.',
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundGradient(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Frequently Asked Questions",
                    style: kMontSemiBold.copyWith(fontSize: 24),
                  ),
                ),
                const Divider(color: kBlack, thickness: 3),
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _items[index].isExpanded = !isExpanded;
                    });
                  },
                  children: _items.map<ExpansionPanel>((Item item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(
                            item.question,
                            style: kMontSemiBold,
                          ),
                        );
                      },
                      body: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            item.answer,
                            style: kMontMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      isExpanded: item.isExpanded,
                    );
                  }).toList(),
                ),
                const Divider(color: kBlack, thickness: 3),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Still have questions?",
                    style: kMontSemiBold.copyWith(fontSize: 24),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPurple,
                    foregroundColor: kWhite,
                  ),
                  onPressed: () {
                    // Do something
                  },
                  child: Text('Contact Us'),
                ),
              ],
            ),
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
