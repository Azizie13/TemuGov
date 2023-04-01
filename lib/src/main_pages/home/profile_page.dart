import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/size_config.dart';
import 'package:temugov_dev/src/user_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isAgreed = false;
  final UserData user = UserData();

  @override
  Widget build(BuildContext context) {
    user.fullName = 'James Bond';
    user.icNumber = '010123-10-1234';
    user.email = 'test_email@gmail.com';
    user.phoneNumber = '+60171234567';
    user.gender = 'm';
    user.userName = 'James';
    user.userUID = 4107;

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPurple,
        title: const Text(
          "Profile",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Divider(
              color: kBlack,
              thickness: 2,
            ),
            ClipOval(
              child: Image.asset(
                'assets/images/Profile.png',
                height: 138,
                width: 138,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          user.getTemuGovID(),
          style: kOpenSansBold.copyWith(fontSize: 16),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 0.0, bottom: 10.0),
        child: Text(
          "TemuGOV ID",
          style: kOpenSansBold.copyWith(fontSize: 16, color: Colors.grey),
        ),
      ),
      Container(
        width: 335,
        height: 384,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: kPurple),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildInfo("Full Name", user.fullName),
              ..._buildInfo("IC", user.icNumber),
              ..._buildInfo("E-mail", user.email),
              ..._buildInfo("Phone Number", user.phoneNumber),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 21.0, top: 19.0, bottom: 9),
                    child: Text(
                      "Gender : ",
                      style: kOpenSansExtraBold.copyWith(
                          fontSize: 15, color: kWhite),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: kWhite),
                    child: Center(
                        child: Icon(user.gender == 'm'
                            ? Icons.person
                            : Icons.person_2)),
                  ),
                ],
              ),
              Row(
                children: [
                  CheckboxTheme(
                    data: CheckboxThemeData(
                        checkColor: const MaterialStatePropertyAll(kWhite),
                        fillColor: const MaterialStatePropertyAll(kBlack),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: kWhite),
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: Checkbox(
                        value: isAgreed,
                        onChanged: (value) {
                          setState(() {
                            isAgreed = value!;
                            user.hasAgreed = isAgreed;
                          });
                          debugPrint('Button pressed');
                        }),
                  ),
                  Text(
                    "I have read and agreed to the\nterms & conditions",
                    style:
                        kOpenSansSemiBold.copyWith(fontSize: 12, color: kWhite),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  IconButton(
                      onPressed: () {
                        debugPrint('Edit profile page');
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: kWhite,
                      )),
                ],
              ),
            ]),
      ),
    ]);
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
