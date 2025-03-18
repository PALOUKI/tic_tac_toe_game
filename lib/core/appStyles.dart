import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils.dart';


class AppTextStyles {
  // Headlines
  static TextStyle headline1 = TextStyle(
    fontSize: getSize(32)   ,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static  TextStyle headline2 = TextStyle(
    fontSize: getSize(28),
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static  TextStyle headline3 = TextStyle(
    fontSize: getSize(22),
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  // Subtitles
  static  TextStyle subtitle1 = TextStyle(
    fontSize: getSize(18),
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static TextStyle subtitle2 = TextStyle(
    fontSize: getSize(16),
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  // Body Text
  static TextStyle bodyText1 = TextStyle(
    fontSize: getSize(14),
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static TextStyle bodyText2 = TextStyle(
    fontSize: getSize(12),
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  // Caption
  static  TextStyle caption = TextStyle(
    fontSize: getSize(10),
    fontWeight: FontWeight.w300,
    color: Colors.black38,
  );

  // Button
  static  TextStyle button = TextStyle(
    fontSize: getSize(16),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Overline
  static TextStyle overline = TextStyle(
    fontSize: getSize(10),
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: Colors.black54,
  );

  // Error Text
  static  TextStyle errorText = TextStyle(
    fontSize: getSize(12),
    fontWeight: FontWeight.w400,
    color: Colors.redAccent,
  );

  // Input Fields
  static  TextStyle inputLabel = TextStyle(
    fontSize: getSize(14),
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static TextStyle inputHint = TextStyle(
    fontSize: getSize(14),
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  // Light Button
  static  TextStyle lightButton = TextStyle(
    fontSize: getSize(14),
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  // Link
  static TextStyle link = TextStyle(
    fontSize: getSize(14),
    fontWeight: FontWeight.w400,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  // Extra Small Text
  static TextStyle extraSmall = TextStyle(
    fontSize: getSize(8),
    fontWeight: FontWeight.w300,
    color: Colors.black54,
  );
}
