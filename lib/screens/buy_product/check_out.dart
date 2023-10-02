import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/colors.dart';
import 'package:smart_shopy/constants/strings.dart';
import 'package:smart_shopy/constants/styles.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* App bar
      appBar: AppBar(
        title: checkout.text.size(23).fontFamily(bold).make(),
      ),
      //* Body

      body: Center(
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: redColor,
          ),
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(12.0),
      //   child: Column(
      //     children: [
      //       36.heightBox,
      //       Container(
      //         height: 80,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //             border: Border.all(
      //           color: redColor,
      //           width: 2,
      //         )),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
