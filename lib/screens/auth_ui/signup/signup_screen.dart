import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/constants.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/constants/routes.dart';
import 'package:smart_shopy/firebase/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:smart_shopy/screens/home/home_screen.dart';
import 'package:smart_shopy/widgets/primary_button/primary_button.dart';
import 'package:smart_shopy/widgets/top_title/top_title.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isShowPassword = false;
  TextEditingController nameIn = TextEditingController();
  TextEditingController emailIn = TextEditingController();
  TextEditingController phoneIn = TextEditingController();
  TextEditingController passwordIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                20.heightBox,
                const Center(
                  //* Login text
                  child: TopTitle(
                    title: signup,
                    subTitle: createNewAcc,
                  ),
                ),
                45.heightBox,

                //* Name input field

                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: name.text
                        .color(redColor)
                        .fontFamily(semibold)
                        .size(16)
                        .make(),
                  ),
                ),
                5.heightBox,
                TextFormField(
                  controller: nameIn,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                    ),
                    hintText: 'Admin',
                  ),
                ),
                //* Email input field
                20.heightBox,
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                    hintText: emailHint,
                  ),
                ),

                //* Phone Number input field
                20.heightBox,
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: phone.text
                        .color(redColor)
                        .fontFamily(semibold)
                        .size(16)
                        .make(),
                  ),
                ),
                5.heightBox,
                TextFormField(
                  controller: phoneIn,
                  keyboardType: TextInputType.phone,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone_android_outlined,
                    ),
                    hintText: passwordHint,
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
                    bool isValidated = signupValidation(emailIn.text,
                        passwordIn.text, nameIn.text, phoneIn.text);
                    if (isValidated) {
                      bool isSignUp = await FirebaseAuthHelper.instance
                          .signup(emailIn.text, passwordIn.text, context);
                      if (isSignUp) {
                        Routes.instance.pushAndRemoveUntil(
                            widget: const HomeScreen(), context: context);
                      }
                    }
                  },
                  title: signup,
                ),
                16.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alreadyHaveAcc.text.color(fontGrey).make(),
                    8.widthBox,
                    login.text
                        .color(redColor)
                        .fontFamily(semibold)
                        .make()
                        .onTap(
                      () {
                        Navigator.of(context).pop();
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
