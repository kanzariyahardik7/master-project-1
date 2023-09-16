import 'package:flutter/material.dart';
import 'package:masterapp/pages/ListingPage.dart';
import 'package:masterapp/pages/Wscube.dart';
import 'package:masterapp/pages/animatedContainer.dart';
import 'package:masterapp/pages/bmiCalculator.dart';
import 'package:masterapp/pages/heroAnimation/heroAnimation.dart';
import 'package:masterapp/pages/neomorphisom.dart';
import 'package:masterapp/pages/permission.dart';
import 'package:masterapp/pages/stlstfwidget.dart';
import 'package:masterapp/pages/twinAnimation.dart';
import 'package:masterapp/ui_helper/utils.dart';
import 'package:masterapp/ui_helper/masterpage_container.dart';
import '3dList.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar("Master App"),
        body: ListView(
          //physics: NeverScrollableScrollPhysics(),
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListingPage()));
                },
                child: CustomContainer("API caliing page")),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Permissionn()));
                },
                child: CustomContainer("InAppWebView")),
            InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => WsCube()));
                },
                child: CustomContainer("WS CUBE")),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DeshboardPage()));
                },
                child: CustomContainer("Niomorphisom")),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => incriment()));
                },
                child: CustomContainer("Increment operators")),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BmiCalculator()));
                },
                child: CustomContainer("BMI Calculator App")),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AnmContainer()));
                },
                child: CustomContainer("Animeted Container")),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HeroAnimation()));
                },
                child: CustomContainer("Hero Animation")),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ThreeDList()));
                },
                child: CustomContainer("3D List")),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => twinAnimation()));
                },
                child: CustomContainer("Twin Animation")),
          ],
        ));
  }
}
