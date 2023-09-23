import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/consts.dart';

class TopTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopTitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Back button
        if (title == login || title == signup)
          const Align(
            alignment: Alignment.topLeft,
            child: BackButton(),
          ),
        //* Welcome text
        20.heightBox,
        title.text.fontFamily(bold).size(30).color(redColor).make(),
        5.heightBox,
        subTitle.text.fontFamily(regular).color(darkFontGrey).make(),
        20.heightBox,
      ],
    );
  }
}
