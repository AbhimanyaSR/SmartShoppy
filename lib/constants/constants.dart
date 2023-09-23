import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_shopy/constants/colors.dart';
import 'package:smart_shopy/constants/consts.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: redColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: redColor,
              ),
              18.heightBox,
              loading.text
                  .make()
                  .box
                  .margin(const EdgeInsets.only(left: 7))
                  .make(),
            ],
          ),
        );
      },
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => alert,
  );
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used. Go to login page.";
    case "account-exist-with-different-credential":
      return "Email already used. Go to login page.";
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong Password";
    case "ERROR_USER_NOT_FOUND":
      return "User not found";
    case "user-not-found":
      return "User not found";
    case "ERROR_INVALID_EMAIL":
      return "User not found";
    case "invalid-email":
      return "User not found";
    case "ERROR_USER_DISABLED":
      return "User disabled";
    case "user-disabled":
      return "User disabled";
    case "ERROR_TOO_MANY_REQUESTS":
      return "To many requests to this account";
    case "operation-not-allowed":
      return "To many requests to this account";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "To many requests to this account";

    default:
      return "Login failed";
  }
}

//! Login Validation

bool loginValidation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage(enterDetails);
    return false;
  } else if (password.isEmpty) {
    showMessage(emptyPass);
    return false;
  } else if (email.isEmpty) {
    showMessage(emptyMail);
    return false;
  } else {
    return true;
  }
}

//! Signup Validaation

bool signupValidation(
    String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessage(enterDetails);
    return false;
  } else if (password.isEmpty) {
    showMessage(emptyPass);
    return false;
  } else if (name.isEmpty) {
    showMessage(emptyName);
    return false;
  } else if (phone.isEmpty) {
    showMessage(emptyPhone);
    return false;
  } else if (email.isEmpty) {
    showMessage(emptyMail);
    return false;
  } else {
    return true;
  }
}
