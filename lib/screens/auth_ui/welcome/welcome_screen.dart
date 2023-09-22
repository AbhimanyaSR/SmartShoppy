import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/colors.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/constants/routes.dart';
import 'package:smart_shopy/screens/auth_ui/login/login_screen.dart';
import 'package:smart_shopy/screens/auth_ui/signup/signup_screen.dart';
import 'package:smart_shopy/widgets/primary_button/primary_button.dart';
import 'package:smart_shopy/widgets/top_title/top_title.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:smart_shopy/constants/images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //* Welcome text
              20.heightBox,
              const TopTitle(
                title: Welcome,
                subTitle: buyYourfav,
              ),
              20.heightBox,

              //* Welcome image
              Image.asset(welcomeImg),
              20.heightBox,

              //* Social icon buttons

              loginWith.text
                  .letterSpacing(1)
                  .color(redColor.withOpacity(.7))
                  .fontFamily(semibold)
                  .size(16)
                  .make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    shape: const CircleBorder(),
                    onPressed: () {},
                    child: Image.asset(
                      icFacebookLogo,
                      scale: 6,
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    shape: const CircleBorder(),
                    onPressed: () {},
                    child: Image.asset(
                      icGoogleLogo,
                      scale: 6,
                    ),
                  )
                ],
              ),

              //* Log in button
              35.heightBox,
              PrimaryButton(
                  onPressed: () {
                    Routes.instance
                        .push(widget: const LoginScreen(), context: context);
                  },
                  title: login),

              //* Sign up button
              20.heightBox,
              PrimaryButton(
                  onPressed: () {
                    Routes.instance
                        .push(widget: const SignupScreen(), context: context);
                  },
                  title: signup),
              const Expanded(child: SizedBox()),

              //* Credit text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified,
                    color: redColor.withOpacity(.2),
                    size: 16,
                  ),
                  5.widthBox,
                  credits.text
                      .color(redColor.withOpacity(.2))
                      .fontFamily(bold)
                      .make(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
