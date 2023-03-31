import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class AppointManagePage extends StatelessWidget {
  AppointManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kPurple,
        title: const Text(
          "Manage Appointments",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundGradient(),
          child: SafeArea(child: _buildSettings())),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          tooltip: 'Make new appointments',
          backgroundColor: kPurple,
          foregroundColor: kWhite,
          onPressed: () {
            debugPrint("Navigate user home page.");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  final List<String> appointmentsNames = [
    "KKM",
    "JPJ",
    "KDN",
    "KKM",
  ];

  final List<DateTime> appointmentsDates = [
    DateTime(2023, 1, 1, 10, 30),
    DateTime(2023, 2, 21, 13, 30),
    DateTime(2023, 3, 30, 10, 30),
    DateTime(2023, 4, 19, 10, 30),
  ];

  final List<String> appointmentsLocations = [
    "Hospital Shah Alam",
    "Hospital Shah Alam",
    "Hospital Shah Alam",
    "Hospital Shah Alam",
  ];

  final List<MaterialColor> appointmentColors = [
    Colors.pink,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  Padding _buildSettings() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: appointmentsNames.length,
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
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: appointmentColors[index % 4],
                          boxShadow: kBoxShadow,
                          borderRadius: BorderRadius.circular(18)),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              appointmentsDates[index].day.toString(),
                              style: kOpenSansBold.copyWith(fontSize: 20),
                            ),
                            Text(
                              DateFormat('MMM')
                                  .format(appointmentsDates[index]),
                              style: kOpenSansBold.copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointmentsNames[index],
                            style: kOpenSansExtraBold.copyWith(fontSize: 16),
                          ),
                          Text(
                            '${appointmentsDates[index].hour}:${appointmentsDates[index].minute}',
                            style: kOpenSansSemiBold.copyWith(fontSize: 14),
                          ),
                          Text(
                            appointmentsLocations[index],
                            style: kOpenSansSemiBold.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 35,
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
