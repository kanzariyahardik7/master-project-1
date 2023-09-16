import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masterapp/pages/masterpage.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:masterapp/ui_helper/mytext.dart';
import 'package:masterapp/ui_helper/sharedprefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Phone :",
                  color: Black,
                  fontsize: 20,
                  fontweight: FontWeight.w400,
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  cursorColor: Black,
                  style: TextStyle(
                      color: Black, fontSize: 20, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Black, width: 2)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                MyText(
                  text: "Password :",
                  color: Black,
                  fontsize: 20,
                  fontweight: FontWeight.w400,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Black,
                  style: TextStyle(
                      color: Black, fontSize: 20, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Black, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                InkWell(
                    onTap: () async {
                      log("===>**");
                      var sharedprefs = await SharedPreferences.getInstance();
                      await sharedprefs.setString("islogin", "yes");
                      var read = await sharedprefs.getString("islogin");
                      log("===>$read");
                      if (read == "yes") {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MasterPage()));
                      }
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                            color: Black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: MyText(
                          text: "Login",
                          color: White,
                          fontsize: 20,
                          fontweight: FontWeight.w700,
                        )))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                            color: Black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: MyText(
                          text: "Sign-in with Google",
                          color: White,
                          fontsize: 20,
                          fontweight: FontWeight.w700,
                        )))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
