import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/constants.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/constants/routes.dart';
import 'package:smart_shopy/firebase/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:smart_shopy/screens/auth_ui/signup/signup_screen.dart';
import 'package:smart_shopy/screens/home/home_screen.dart';
import 'package:smart_shopy/widgets/primary_button/primary_button.dart';
import 'package:smart_shopy/widgets/top_title/top_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShowPassword = false;
  TextEditingController emailIn = TextEditingController();
  TextEditingController passwordIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.heightBox,
                const Center(
                  //* Login text
                  child: TopTitle(
                    title: login,
                    subTitle: welcomeBack,
                  ),
                ),

                //* Email input field
                45.heightBox,
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: email.text
                        .color(redColor)
                        .fontFamily(semibold)
                        .size(16)
                        .make(),
                  ),
                ),
                5.heightBox,
                TextFormField(
                  controller: emailIn,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                    hintText: emailHint,
                  ),
                ),

                //* Password input field
                20.heightBox,
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: password.text
                        .color(redColor)
                        .fontFamily(semibold)
                        .size(16)
                        .make(),
                  ),
                ),
                5.heightBox,
                TextFormField(
                  controller: passwordIn,
                  obscureText: !isShowPassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                    ),
                    hintText: passwordHint,
                    suffixIcon: MaterialButton(
                      child: Icon(
                        isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: fontGrey,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            isShowPassword = !isShowPassword;
                          },
                        );
                      },
                    ),
                  ),
                ),

                //* Login button
                40.heightBox,
                PrimaryButton(
                  onPressed: () async {
                    bool isValidated = loginValidation(emailIn.text, passwordIn.text);
                    if (isValidated) {
                      bool isLogined = await FirebaseAuthHelper.instance
                          .login(email, password, context);
                      if (isLogined) {
                        Routes.instance.pushAndRemoveUntil(
                            widget: const HomeScreen(), context: context);
                      }
                    }
                  },
                  title: login,
                ),
                16.heightBox,
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: forgetPass.text.color(Colors.blue).make().onTap(
                          () {},
                        ),
                  ),
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createNewAccount.text.color(fontGrey).make(),
                    8.widthBox,
                    signup.text
                        .color(redColor)
                        .fontFamily(semibold)
                        .make()
                        .onTap(
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
