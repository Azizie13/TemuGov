import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class ToDoPage extends StatelessWidget {
  ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kPurple,
        title: const Text(
          "Things to do",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundGradient(),
          child: SafeArea(child: _buildSettings())),
    );
  }

  List<String> todoList = [
    'Register your account',
    'Validate your personal details',
    'Successfully make your first appointment',
    'View your current active appointment',
  ];

  ListView _buildSettings() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 50),
                    decoration: BoxDecoration(
                        color: kBlack.withOpacity(0.5),
                        shape: BoxShape.circle,
                        boxShadow: kBoxShadow),
                    child: CircleAvatar(
                      backgroundColor: kBlack,
                      radius: 27,
                      foregroundColor: kWhite,
                      child: Text(
                        '${index + 1}',
                        style:
                            kOpenSansBold.copyWith(fontSize: 20, color: kWhite),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      todoList[index],
                      style:
                          kOpenSansBold.copyWith(fontSize: 20, color: kBlack),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
