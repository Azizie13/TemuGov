import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/main_pages/utils/dependent_page.dart';
import 'package:temugov_dev/src/main_pages/utils/setting_page.dart';
import 'package:temugov_dev/src/main_pages/utils/todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildIcon(IconData icon, String text, void Function()? onPressed) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              maxRadius: 25,
              backgroundColor: kBlack,
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(icon),
                color: Colors.white,
                iconSize: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(3.0),
            child: Text(
              text,
              style: kOpenSansBold.copyWith(fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget agencyAppoinmentSelector(BuildContext context, Color? backgroundColor,
      Color bannerColor, List<String> appointments, String name) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(57.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(4, 4),
              )
            ],
          ),
          height: 130,
          width: 330,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      appointments[index],
                      style: kOpenSansBold.copyWith(fontSize: 10.0),
                    ),
                    Container(
                      width: 55,
                      height: 50,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(10.0)),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          height: 32,
          width: 270,
          decoration: BoxDecoration(
              color: bannerColor,
              borderRadius: BorderRadius.circular(60.0),
              boxShadow: kBoxShadow),
          padding: const EdgeInsets.all(10.0),
          child: Positioned(
            height: 10.0,
            child: Center(
              child: Text(
                name,
                style: kMontBold.copyWith(fontSize: 9, color: kWhite),
              ),
            ),
          ),
        ),
        const Positioned(
          left: 30,
          child: CircleAvatar(
            backgroundColor: kBlack,
            radius: 25,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 56,
                height: 56,
              ),
              Text(
                "TemuGOV",
                style: kMontExtraBold.copyWith(fontSize: 24),
              ),
              const SizedBox(
                width: 52,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ToDoPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPurple,
                    foregroundColor: kWhite,
                    minimumSize: const Size(95, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                child: Text(
                  "To-do List",
                  style: kMontExtraBold.copyWith(fontSize: 15, color: kWhite),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIcon(
                        Icons.calendar_month_sharp, "Appointments", () {}),
                    _buildIcon(Icons.question_mark_sharp, "FAQ", () {}),
                    _buildIcon(Icons.chat, "HelperBot", () {}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIcon(Icons.supervisor_account, "Dependents", () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DependentPage()));
                    }),
                    _buildIcon(Icons.settings, "Settings", () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SettingPage()));
                    }),
                    _buildIcon(Icons.more_horiz_sharp, "More", () {})
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 27, bottom: 12),
            child: Text(
              "Set Up Your Appointment",
              style: kMontExtraBold.copyWith(fontSize: 17),
            ),
          ),
          agencyAppoinmentSelector(
              context,
              Colors.purple,
              kBlack,
              ["Dentistry", "Pregnancy", "Dermatologist", "More"],
              "KEMENTERIAN KESIHATAN MALAYSIA"),
          agencyAppoinmentSelector(
              context,
              Colors.pink,
              kBlack,
              ["JPJ", "License Renewal", "Logistic", "More"],
              "KEMENTERIAN PENGANGKUTAN MALAYSIA"),
          agencyAppoinmentSelector(context, Colors.yellow, kBlack,
              ["IC", "Passport", "VISA", "More"], "KEMENTERIAN DALAM NEGERI"),
        ]),
      ),
    );
  }
}
