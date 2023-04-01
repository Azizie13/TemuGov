import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/overlay_widget.dart';
import 'package:temugov_dev/src/main_pages/utils/appointment_mng_page.dart';
import 'package:temugov_dev/src/main_pages/utils/appointment_page.dart';
import 'package:temugov_dev/src/main_pages/home/chatbot_page.dart';
import 'package:temugov_dev/src/main_pages/utils/dependent_page.dart';
import 'package:temugov_dev/src/main_pages/utils/faq_page.dart';
import 'package:temugov_dev/src/main_pages/utils/fast_lane_page.dart';
import 'package:temugov_dev/src/main_pages/utils/news_page.dart';
import 'package:temugov_dev/src/main_pages/utils/setting_page.dart';
import 'package:temugov_dev/src/main_pages/utils/todo_page.dart';

class HomePageGuest extends StatelessWidget {
  const HomePageGuest({super.key});

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

  Widget _agencyAppoinmentBuilder(
      BuildContext context,
      Color? backgroundColor,
      Color bannerColor,
      List<String> appointments,
      List<String> appointmentsFileNames,
      String agencyName,
      String filename) {
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
          width: 330,
          height: 130,
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
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => AppointPage(
                        //           appointmentName: agencyName,
                        //           appointmentCategory: appointments[index],
                        //         )));
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return OverlayWidget(
                              child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Please sign up to unlock this feature.',
                                    style: kMontMedium.copyWith(
                                      fontSize: 20,
                                      color: kWhite,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            );
                          },
                        ));
                      },
                      child: Container(
                        width: 55,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/services/${appointmentsFileNames[index]}.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
                agencyName,
                style: kMontBold.copyWith(fontSize: 9, color: kWhite),
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          child: CircleAvatar(
              backgroundColor: kBlack,
              radius: 25,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/gov_logo/$filename.png",
                  fit: BoxFit.cover,
                  width: 45,
                  height: 45,
                ),
              )),
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
                width: 60,
                height: 60,
              ),
              Text(
                "TemuGOV",
                style: kMontExtraBold.copyWith(fontSize: 24),
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ToDoPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange[900],
                    foregroundColor: kWhite,
                    minimumSize: const Size(95, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                child: Text(
                  "Guest Mode",
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
                    _buildIcon(Icons.question_mark_sharp, "FAQ", () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FAQPage()));
                    }),
                    _buildIcon(Icons.chat, "News", () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NewsPage()));
                    }),
                    _buildIcon(Icons.search, "Search", () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SettingPage()));
                    }),
                    _buildIcon(Icons.settings, "Settings", () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SettingPage()));
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [],
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
          _agencyAppoinmentBuilder(
              context,
              Colors.purple,
              kBlack,
              ["Dentistry", "Pregnancy", "Dermatologist", "More"],
              ["dentistry", "pregnancy", "dermatologist", "arrow_right"],
              "KEMENTERIAN KESIHATAN MALAYSIA",
              'KKM'),
          _agencyAppoinmentBuilder(
              context,
              Colors.pink,
              kBlack,
              ["JPJ", "License Renewal", "Logistic", "More"],
              ["jpj", "renew_license", "logistic", "arrow_right"],
              "KEMENTERIAN PENGANGKUTAN MALAYSIA",
              'MOT'),
          _agencyAppoinmentBuilder(
              context,
              Colors.yellow,
              kBlack,
              ["IC", "Passport", "VISA", "More"],
              ["ic", "passport", "visa", "arrow_right"],
              "KEMENTERIAN DALAM NEGERI",
              "KDN"),
        ]),
      ),
    );
  }
}
