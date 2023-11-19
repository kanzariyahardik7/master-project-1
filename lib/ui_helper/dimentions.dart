import 'package:flutter/material.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/*  this function is makes for testing purpose  */
Widget customSizedBox({double? yourHeight, double? width}) {
  return SizedBox(
    height: yourHeight,
    width: width,
  );
}
