import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';
import 'package:temugov_dev/src/info_pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // Todo:
  // Make 'Continue as Guest' not available on first time login screen

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
                  "LOGIN",
                  style: kMontExtraBold.copyWith(
                    fontSize: 50,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                _buildTextInput("USERNAME"),
                _buildTextInput("PASSWORD", obsecureText: true),
                TextButton(
                    onPressed: () {
                      debugPrint("Text pressed");
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: kOpenSansRegular.copyWith(
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5),
                    )),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPurple,
                      foregroundColor: kWhite,
                      minimumSize: const Size(180, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  child: Text(
                    "Log in",
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
                  height: 30,
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
                      SignInButtonBuilder(
                        text: 'Continue as guest',
                        icon: Icons.supervised_user_circle,
                        onPressed: () {},
                        backgroundColor: kBlack,
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
