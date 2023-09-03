import 'dart:async';
import 'package:flutter/material.dart';
import 'package:photos/UI_2023/LoginPage.dart';
import 'package:photos/UI_2023/masterpage.dart';
import 'package:photos/ui_helper/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  static const String KEYLOGIN = "Login";
  late Animation animation1;
  late Animation animation2;
  late Animation ColorAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    whereToGo();

    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation1 = Tween(begin: 150.0, end: 210.0).animate(animationController);
    animation2 = Tween(begin: 200.0, end: 300.0).animate(animationController);
    ColorAnimation = ColorTween(begin: Colors.white,end: Colors.indigo).animate(animationController);

    animationController.addListener(() {
      // print(animation.value);
      setState(() {

      });
    });
    animationController.forward();
  }

  void whereToGo() async{

    var sharedprefs = await SharedPreferences.getInstance();
    var isLoggedin = sharedprefs.getBool(KEYLOGIN);

    Timer(Duration(seconds: 3), () {

      if (isLoggedin != null){
        if(isLoggedin == true){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {return MasterPage();},));
        }else{
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {return LoginPage();},));
        }
      }
      else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {return LoginPage();},));
      }
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          //decoration: BoxDecoration(gradient: Orange_Gradiant()),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    elevation: 10,
                    color: ColorAnimation.value,
                    shape:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Container(
                      height: animation1.value,
                        width: animation2.value,
                         child: Center(
                             child:Icon(Icons.account_balance,size: 70,color: Colors.white,)
                         //Text("Hello..",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32,color: Colors.white),)
                         )
                    ),
                  ),
                  Text("Welcome to Master app", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32,color: Colors.indigo),),
                ],
              )),
        ),
      );
}