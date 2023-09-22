import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/consts.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const PrimaryButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return //* Log in button
        MaterialButton(
      child: title.text
          .fontFamily(bold)
          .white
          .center
          .size(20)
          .make()
          .box
          .color(redColor)
          .padding(const EdgeInsets.all(13))
          .width(double.infinity)
          .rounded
          .shadowSm
          .make(),
      onPressed: onPressed,
    ).onTap(() {});
  }
}
