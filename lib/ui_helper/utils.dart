import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:masterapp/ui_helper/mytext.dart';

TextStyle FONT_20_BOLD() {
  return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      //fontFamily: "LobsterFont",
      color: Colors.black);
}

TextStyle FONT_18_BOLD() {
  return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      //fontFamily: "LobsterFont",
      color: Colors.white);
}

TextStyle FONT_16_BOLD() {
  return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      //fontFamily: "LobsterFont",
      color: Colors.white);
}

LinearGradient Orange_Gradiant() {
  return LinearGradient(colors: [
    Color(0xff4b3987),
    Color(0xffaab1e5),
  ]);
}

TextStyle APPBAR_FONT_STYLE() {
  return TextStyle(
      fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white);
}

AppBar Custom_Appbar(String appbartitle) {
  return AppBar(
    backgroundColor: Black,
    iconTheme: IconThemeData(color: White),
    title: MyText(
      color: White,
      text: appbartitle,
      fontsize: 25,
      fontweight: FontWeight.w500,
    ),
  );
}

TextStyle Info_bold_style() {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
}

TextStyle Info_regular_style() {
  return TextStyle(fontSize: 15);
}

TextStyle FONT_15_BOLD() {
  return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      //fontFamily: "LobsterFont",
      color: Colors.black);
}

LinearGradient Green_Gradiant() {
  return LinearGradient(colors: [
    Color(0xffd4fc79),
    Color(0xff96e6a1),
  ]);
}
