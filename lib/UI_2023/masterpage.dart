import 'package:flutter/material.dart';
import 'package:photos/Api/ApiScreen/ListingPage.dart';
import 'package:photos/UI_2023/Drwer/Drawer.dart';
import 'package:photos/UI_2023/animatedContainer.dart';
import 'package:photos/UI_2023/bmiCalculator.dart';
import 'package:photos/UI_2023/custom_widget_1.dart';
import 'package:photos/UI_2023/ChatUI.dart';
import 'package:photos/UI_2023/GridView.dart';
import 'package:photos/UI_2023/custom_widget_2.dart';
import 'package:photos/UI_2023/heroAnimation/heroAnimation.dart';
import 'package:photos/UI_2023/mapListWidget.dart';
import 'package:photos/UI_2023/neomorphisom.dart';
import 'package:photos/UI_2023/rippleAnimation.dart';
import 'package:photos/UI_2023/stlstfwidget.dart';
import 'package:photos/UI_2023/twinAnimation.dart';
import 'package:photos/UI_2023/wscube.dart';
import 'package:photos/ui_helper/utils.dart';
import 'package:photos/ui_helper/Widgets/masterpage_container.dart';
import '3dList.dart';
import 'ui_2023.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: MyDrawer(),
        ),
        appBar: Custom_Appbar("Master App"),
        body: ListView(
          //physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListingPage()));
                    },
                    child: CustomContainer("API caliing page")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TeamFolderPage()));
                    },
                    child: CustomContainer("UI 2023 1")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => WsCube()));
                    },
                    child: CustomContainer("WS CUBE")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ChatUI()));
                    },
                    child: CustomContainer("ChatUI Page")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GridViewPage()));
                    },
                    child: CustomContainer("Grid View")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CustomWidget()));
                    },
                    child: CustomContainer("Custom Widget 1")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DeshboardPage()));
                    },
                    child: CustomContainer("Niomorphisom")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CustomWidget2()));
                    },
                    child: CustomContainer("Custom Widget 2")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => incriment()));
                    },
                    child: CustomContainer("Increment operators")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BmiCalculator()));
                    },
                    child: CustomContainer("BMI Calculator App")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnmContainer()));
                    },
                    child: CustomContainer("Animeted Container")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HeroAnimation()));
                    },
                    child: CustomContainer("Hero Animation")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ThreeDList()));
                    },
                    child: CustomContainer("3D List")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => mapList()));
                    },
                    child: CustomContainer("Mapping List Widget")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => twinAnimation()));
                    },
                    child: CustomContainer("Twin Animation")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => rippleAnimation()));
                    },
                    child: CustomContainer("Ripple Animation")),
              ],
            ),
          ],
        ));
  }
}
