import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';

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
              backgroundColor: Colors.black,
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
          decoration: BoxDecoration(
              color: bannerColor, borderRadius: BorderRadius.circular(60.0)),
          padding: const EdgeInsets.all(10.0),
          child: Positioned(
            height: 10.0,
            child: Text(
              name,
              style: kMontBold.copyWith(fontSize: 10, color: kWhite),
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kPurple,
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
                onPressed: () {},
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
                    _buildIcon(Icons.supervisor_account, "HelperBot", () {}),
                    _buildIcon(Icons.settings, "Settings", () {}),
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
              Colors.black,
              ["Dentistry", "Pregnancy", "Dermatologist", "More"],
              "KEMENTERIAN KESIHATAN MALAYSIA"),
          agencyAppoinmentSelector(
              context,
              Colors.pink,
              Colors.black,
              ["JPJ", "License Renewal", "Logistic", "More"],
              "KEMENTERIAN PENGANGKUTAN MALAYSIA"),
          agencyAppoinmentSelector(context, Colors.yellow, Colors.black,
              ["IC", "Passport", "VISA", "More"], "KEMENTERIAN DALAM NEGERI"),
        ]),
      ),
    );
  }
}
