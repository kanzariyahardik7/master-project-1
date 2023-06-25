import 'dart:async';

import 'package:flutter/material.dart';
import 'package:photos/UI_2023/LoginPage.dart';
import 'package:photos/UI_2023/masterpage.dart';
import 'package:photos/ui_helper/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: Orange_Gradiant()),
          child: Center(
              child: Text(
            "Welcome to Master app",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          )),
        ),
      );
}
