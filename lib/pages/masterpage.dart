import 'package:flutter/material.dart';
import 'package:masterapp/pages/ListingPage.dart';
import 'package:masterapp/pages/Wscube.dart';
import 'package:masterapp/pages/animatedContainer.dart';
import 'package:masterapp/pages/bmiCalculator.dart';
import 'package:masterapp/pages/heroAnimation/heroAnimation.dart';
import 'package:masterapp/pages/language.dart';
import 'package:masterapp/pages/neomorphisom.dart';
import 'package:masterapp/pages/permission.dart';
import 'package:masterapp/pages/profile.dart';
import 'package:masterapp/pages/stlstfwidget.dart';
import 'package:masterapp/pages/twinAnimation.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:masterapp/ui_helper/constant.dart';
import 'package:masterapp/ui_helper/mytext.dart';
import 'package:masterapp/ui_helper/masterpage_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '3dList.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  void initState() {
    getUserdata();
    super.initState();
  }

  getUserdata() async {
    SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    Constant.firebaseid = await sharedprefs.getString("firebaseid");
    Constant.username = await sharedprefs.getString("username");
    Constant.useremail = await sharedprefs.getString("useremail");
    Constant.userphoto = await sharedprefs.getString("userphoto");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(),
        body: ListView(
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

  AppBar customAppbar() {
    return AppBar(
      backgroundColor: Black,
      iconTheme: IconThemeData(color: White),
      title: MyText(
        color: White,
        text: "MasterApp",
        fontsize: 30,
        fontweight: FontWeight.w600,
      ),
      actions: [
        _buildFeatureButton(
          ontap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Language(),
            ));
          },
          icon: Icons.language,
        ),
        SizedBox(
          width: 15,
        ),
        _buildFeatureButton(
          ontap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Profile(),
            ));
          },
          icon: Icons.person,
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }

  Widget _buildFeatureButton(
      {required Function()? ontap, required IconData? icon}) {
    return InkWell(
        onTap: ontap,
        child: Container(
            decoration: BoxDecoration(color: White, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                icon,
                color: Black,
              ),
            )));
  }
}
