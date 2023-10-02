import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/constants/styles.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* App bar
      appBar: AppBar(
        title: orders.text.uppercase.size(23).fontFamily(bold).make(),
      ),
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
    );
  }
}
