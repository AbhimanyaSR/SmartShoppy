import 'package:flutter/material.dart';

class Routes {
  static Routes instance = Routes();
  pushAndRemoveUntil({required Widget widget,required BuildContext context}) async {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (route) => false);
  }

  push({required Widget widget,required BuildContext context}) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
