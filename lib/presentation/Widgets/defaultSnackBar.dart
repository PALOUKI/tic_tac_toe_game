import 'package:flutter/material.dart';

class DefaultSnackBar {

  static void showCustomSnackBar(
      BuildContext context, String message, bool isErrorMessage) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: isErrorMessage ? Colors.redAccent : Colors.greenAccent,
        ),
      ),
      backgroundColor: isErrorMessage ? Colors.grey : Colors.black,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}