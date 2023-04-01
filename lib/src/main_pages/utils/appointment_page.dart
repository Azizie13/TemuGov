import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class AppointPage extends StatefulWidget {
  const AppointPage({super.key, required this.appointmentName});

  final String appointmentName;

  @override
  State<AppointPage> createState() => _AppointPageState();
}

class _AppointPageState extends State<AppointPage> {
  int progressValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kPurple,
        title: const Text(
          "Make Appointments",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundGradient(),
          child: SafeArea(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  'Category: ${widget.appointmentName}',
                  style: kOpenSansSemiBold,
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  LinearProgressIndicator(
                    value: progressValue / 100,
                    color: kLightPurple,
                    backgroundColor: kLighterPurple,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Profile',
                  style: kOpenSansExtraBold.copyWith(fontSize: 24),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(11.0),
                decoration: BoxDecoration(
                    color: kPurple, borderRadius: BorderRadius.circular(40.0)),
                width: 340,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ..._buildInfo("Full Name", "James Bond"),
                      ..._buildInfo("IC Number", "James Bond"),
                      ..._buildInfo("E-mail", "James Bond"),
                      ..._buildInfo("Phone Number", "James Bond"),
                      const SizedBox(
                        height: 40,
                      ),
                    ]),
              ),
            ],
          ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            setState(() {
              progressValue += 25;
              if (progressValue > 100) {
                progressValue = 100;
              }
            });
          },
          child: const Icon(
            Icons.arrow_forward,
            color: kWhite,
            size: 50,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInfo(String label, String info) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 21.0, top: 19.0, bottom: 9),
        child: Text(
          label,
          style: kOpenSansExtraBold.copyWith(fontSize: 15, color: kWhite),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 21.0, right: 21.0),
        width: double.infinity,
        height: 23,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: kWhite),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            info,
            style: kOpenSansBold,
          ),
        ),
      ),
    ];
  }
}
