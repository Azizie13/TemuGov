import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';
import 'package:temugov_dev/src/main_pages/home/home_page.dart';
import 'package:temugov_dev/src/root_page.dart';

class AppointPage extends StatefulWidget {
  const AppointPage({
    super.key,
    required this.appointmentName,
    required this.appointmentCategory,
  });

  final String appointmentName;
  final String appointmentCategory;

  @override
  State<AppointPage> createState() => _AppointPageState();
}

class _AppointPageState extends State<AppointPage> {
  static const int maxSteps = 4;

  double progressValue = 100 / maxSteps;
  int currentSteps = 1;
  bool isPM = true;

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> steps = [
      stepOne(),
      stepTwo(),
      stepThree(),
      stepFour(),
    ];

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
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Text(
                    '${widget.appointmentName}\nCategory: ${widget.appointmentCategory}',
                    style: kOpenSansSemiBold,
                    textAlign: TextAlign.center,
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
                ...steps[currentSteps - 1],
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
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
              currentSteps += 1;

              if (progressValue > 100 && currentSteps > 4) {
                progressValue = 100;
                currentSteps = 4;
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const RootPage()));
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

  List<Widget> stepOne() {
    return [
      Column(
        children: [
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
                    height: 50,
                  ),
                ]),
          ),
        ],
      )
    ];
  }

  List<Widget> stepTwo() {
    return [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Location',
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
                  ..._buildInfoWithIcon(
                      "Select your location", "Search", Icons.search),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/Map_sample.png',
                      width: 300,
                      height: 200,
                    ),
                  ),
                  ..._buildDropDown("State", "James Bond"),
                  ..._buildDropDown("District", "James Bean"),
                  ..._buildDropDown("Branch", "James Bean"),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
          ),
        ],
      )
    ];
  }

  List<Widget> stepThree() {
    return [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Time & Date',
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
                  ..._buildInfo("Date of appointment :",
                      "${date.day}/${date.month}/${date.year}"),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kLightPurple,
                            foregroundColor: kWhite),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData().copyWith(
                                      colorScheme: ColorScheme.fromSeed(
                                          seedColor: Colors.deepPurple)),
                                  child: Container(
                                    child: child,
                                  ),
                                );
                              },
                              context: context,
                              initialDate: date,
                              firstDate: date,
                              lastDate: DateTime(2024));

                          if (newDate == null) {
                            return;
                          }

                          setState(() {
                            date = newDate;
                          });
                        },
                        child: Text(
                          'Select Date',
                          style: kOpenSansExtraBold.copyWith(
                              fontSize: 15, color: kWhite),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 21.0, top: 19.0, bottom: 9),
                          child: Text(
                            'Time Range : ',
                            style: kOpenSansExtraBold.copyWith(
                                fontSize: 15, color: kWhite),
                          ),
                        ),
                        Switch(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white,
                          activeColor: kLightPurple,
                          inactiveThumbColor: kLightPurple,
                          value: isPM,
                          onChanged: (value) {
                            setState(() {
                              isPM = !isPM;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: isPM ? kWhite.withOpacity(0.25) : kLightPurple,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'AM',
                          style: kOpenSansExtraBold.copyWith(fontSize: 16),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: isPM ? kLightPurple : kWhite.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'PM',
                          style: kOpenSansExtraBold.copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        2,
                        (i) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                              (j) => _buildTimeSlotContainer(isPM
                                  ? timeSlotsPM[i * 3 + j]
                                  : timeSlotsAM[i * 3 + j])),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      )
    ];
  }

  Container _buildTimeSlotContainer(TimeSlot time) {
    return Container(
      margin: const EdgeInsets.all(9.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: time.isBooked ? Colors.red : Colors.lightGreen,
          borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        time.time,
        style: kOpenSansExtraBold.copyWith(fontSize: 14),
      ),
    );
  }

  List<Widget> stepFour() {
    return [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Confirmation',
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
                  ..._buildInfo("TemuGOV ID:", "James#4107"),
                  ..._buildInfo("Full Name :", "James Bond"),
                  ..._buildInfo("IC Number :", "010101-10-1234"),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 21.0, top: 19.0, bottom: 9),
                    child: Text(
                      "Date of :-",
                      style: kOpenSansExtraBold.copyWith(
                          fontSize: 15, color: kWhite),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInfoColumn("Appointment : ", "01/01/23"),
                      _buildInfoColumn("Application : ", "07/07/07"),
                    ],
                  ),
                  ..._buildInfo("Appointment ID : ", "ABC01234567890"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInfoColumn("Time slot : ", "10:30PM"),
                      _buildInfoColumn("Gov. Agency : ", "KKM"),
                      _buildInfoColumn("Category : ", "Dentistry"),
                    ],
                  ),
                  ..._buildInfo("Branch : ", "KL (Jalan Duta)"),
                  const SizedBox(
                    height: 40,
                  ),
                ]),
          ),
        ],
      )
    ];
  }
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

Widget _buildInfoColumn(String label, String info) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        label,
        style: kOpenSansExtraBold.copyWith(fontSize: 15, color: kWhite),
      ),
    ),
    Container(
      margin: const EdgeInsets.only(left: 2.0, right: 2.0),
      width: 70,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: kWhite),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          info,
          style: kOpenSansBold.copyWith(fontSize: 13),
        ),
      ),
    ),
  ]);
}

List<Widget> _buildInfoWithIcon(String label, String info, IconData icon) {
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
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              info,
              style: kOpenSansBold,
            ),
          ],
        ),
      ),
    ),
  ];
}

List<Widget> _buildDropDown(String label, String info) {
  final items = ['Option 1', 'Option 2', 'Option 3'];

  List<DropdownMenuItem<String>> itemsList = items.map((value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

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
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: kWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: DropdownButton(
          items: itemsList,
          onChanged: (value) {
            // Do something when an option is selected
          },
          value: null,
          hint: Text(
            'Select an option',
            style: kOpenSansBold.copyWith(fontSize: 16),
          ),
          isExpanded: true,
        ),
      ),
    ),
  ];
}

class TimeSlot {
  final String time;
  final bool isBooked;

  TimeSlot(this.time, this.isBooked);
}

List<TimeSlot> timeSlotsAM = [
  TimeSlot('09:00', true),
  TimeSlot('09:30', false),
  TimeSlot('10:00', true),
  TimeSlot('10:30', false),
  TimeSlot('11:00', true),
  TimeSlot('11:30', true),
];

List<TimeSlot> timeSlotsPM = [
  TimeSlot('12:00', false),
  TimeSlot('13:00', true),
  TimeSlot('14:00', true),
  TimeSlot('15:00', true),
  TimeSlot('16:00', false),
  TimeSlot('17:00', false),
];
