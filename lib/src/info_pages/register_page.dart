import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';
import 'package:temugov_dev/src/info_pages/permission_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: backgroundGradient(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "SIGN UP",
                  style: kMontExtraBold.copyWith(
                    fontSize: 50,
                  ),
                ),
                Text(
                  "Register new account",
                  style: kOpenSansSemiBold.copyWith(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildTextInput("USERNAME"),
                _buildTextInput("PASSWORD", obsecureText: true),
                _buildTextInput("CONFIRM PASSWORD", obsecureText: true),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PermissionPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPurple,
                      foregroundColor: kWhite,
                      minimumSize: const Size(180, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  child: Text(
                    "Sign Up",
                    style: kOpenSansBold.copyWith(fontSize: 20, color: kWhite),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "----OR----",
                  style: kMontBold.copyWith(fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(
                        Buttons.AppleDark,
                        mini: false,
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Google,
                        mini: false,
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Facebook,
                        mini: false,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Column _buildTextInput(String text, {bool obsecureText = false}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 46.0),
            child: Text(
              text,
              style: kMontExtraBold.copyWith(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
          child: TextField(
            obscureText: obsecureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: kWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 16),
            maxLines: 1,
            maxLength: 50,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
          ),
        ),
      ],
    );
  }
}

  // Todo:
  // Add 'continue as guest' here

