import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class DependentPage extends StatelessWidget {
  DependentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kPurple,
        title: const Text(
          "Manage Dependents",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundGradient(),
          child: SafeArea(child: _buildSettings())),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new dependents',
        backgroundColor: kPurple,
        foregroundColor: kWhite,
        onPressed: () {
          debugPrint("Add new dependents.");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  final List<String> dependentsNames = [
    "Mom",
    "Dad",
    "Grandmother",
    "Grandfather",
    "Son",
    "Daughter"
  ];

  Padding _buildSettings() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: dependentsNames.length,
          itemBuilder: (context, index) {
            return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: kBoxShadow),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: kBoxShadow, shape: BoxShape.circle),
                      child: const CircleAvatar(
                          backgroundColor: kBlack,
                          radius: 40,
                          child: Icon(
                            Icons.person_outline_rounded,
                            size: 75,
                            color: kWhite,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dependentsNames[index],
                            style: kOpenSansExtraBold.copyWith(fontSize: 16),
                          ),
                          Text(
                            '010121-10-1234',
                            style: kOpenSansSemiBold.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    const Icon(
                      Icons.list,
                      size: 30,
                      color: kBlack,
                    )
                  ],
                ));
          }),
    );
  }
}
