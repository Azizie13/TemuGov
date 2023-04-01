import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class AppointManagePage extends StatefulWidget {
  AppointManagePage({super.key});

  @override
  State<AppointManagePage> createState() => _AppointManagePageState();
}

class _AppointManagePageState extends State<AppointManagePage> {
  bool isOverlayOpened = false;
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
      body: isOverlayOpened
          ? Stack(
              children: [
                _buildMainBody(),
                _buildOverlay(),
              ],
            )
          : _buildMainBody(),
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

  Container _buildMainBody() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundGradient(),
        child: SafeArea(child: _buildSettings()));
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
            Widget liveQbutton = const SizedBox(
              width: 1,
            );

            if (index == 0) {
              liveQbutton = ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kLightPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(90, 30),
                  ),
                  onPressed: () {
                    setState(() {
                      isOverlayOpened = true;
                    });
                  },
                  child: Text(
                    'Live Queue',
                    style: kMontBold.copyWith(fontSize: 11, color: kWhite),
                  ));
            }

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
                          liveQbutton,
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

  Widget _buildOverlay() {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOverlayOpened = false;
            });
          },
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.75)),
        ),
        Container(
          width: 340,
          height: 360,
          decoration: BoxDecoration(
              color: kDeepPurple, borderRadius: BorderRadius.circular(60)),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 24, bottom: 11),
                child: Text(
                  "LIVE QUEUE",
                  style: kMontBold.copyWith(fontSize: 20, color: kWhite),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: kDarkPurple,
                ),
                width: 260,
                height: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Text(
                        "YOUR NUMBER",
                        style: kMontBold.copyWith(fontSize: 20, color: kWhite),
                      ),
                    ),
                    Text(
                      "089",
                      style: kMontBold.copyWith(fontSize: 90, color: kWhite),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Text(
                          "CURRENT NUMBER",
                          style:
                              kMontBold.copyWith(fontSize: 10, color: kWhite),
                        ),
                      ),
                      Text(
                        "079",
                        style: kMontBold.copyWith(fontSize: 48, color: kWhite),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 20,
                    height: 130,
                    decoration: const BoxDecoration(
                      color: kDarkPurple,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Text(
                          "WAITING NUMBER",
                          style:
                              kMontBold.copyWith(fontSize: 10, color: kWhite),
                        ),
                      ),
                      Text(
                        "10",
                        style: kMontBold.copyWith(fontSize: 48, color: kWhite),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Text(
                          "PERSON LEFT",
                          style: kMontBold.copyWith(fontSize: 8, color: kWhite),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
