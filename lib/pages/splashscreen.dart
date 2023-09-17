import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:masterapp/pages/LoginPage.dart';
import 'package:masterapp/pages/masterpage.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation1;
  late Animation animation2;
  late Animation ColorAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    whereToGo();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation1 = Tween(begin: 150.0, end: 210.0).animate(animationController);
    animation2 = Tween(begin: 200.0, end: 300.0).animate(animationController);
    ColorAnimation =
        ColorTween(begin: White, end: Black).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  void whereToGo() async {
    var sharedprefs = await SharedPreferences.getInstance();
    var read = await sharedprefs.getString("islogin");
    log("===>$read");

    Timer(
      Duration(seconds: 3),
      () {
        if (read == "yes") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) {
              return MasterPage();
            },
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
          ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                elevation: 10,
                color: ColorAnimation.value,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Black),
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                    height: animation1.value,
                    width: animation2.value,
                    child: Center(
                        child: Icon(
                      Icons.account_balance,
                      size: 70,
                      color: Colors.white,
                    ))),
              ),
              Text(
                "Welcome to Master app",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 32, color: Black),
              ),
            ],
          )),
        ),
      );
}
