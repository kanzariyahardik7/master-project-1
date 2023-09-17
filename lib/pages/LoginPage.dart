import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masterapp/pages/masterpage.dart';
import 'package:masterapp/provider/userprovider.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:masterapp/ui_helper/constant.dart';
import 'package:masterapp/ui_helper/mytext.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  // late UserProvider userprovider;
  // @override
  // void initState() {
  //   userprovider = Provider.of<UserProvider>(context, listen: false);
  //   super.initState();
  // }

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
                InkWell(
                    onTap: () async {
                      log("===>**");
                      // var sharedprefs = await SharedPreferences.getInstance();
                      // await sharedprefs.setString("islogin", "yes");
                      // var read = await sharedprefs.getString("islogin");
                      // log("===>$read");
                      // if (read == "yes") {
                      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //       builder: (context) => MasterPage()));
                      // }
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
                    onTap: () async {
                      log("===>**");
                      var sharedprefs = await SharedPreferences.getInstance();
                      await sharedprefs.setString("islogin", "yes");
                      googleLogin();
                      // userprovider.googleLogin();
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (context) => MasterPage()));
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                            color: Black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.google,
                              color: White,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            MyText(
                              text: "Sign-in with Google",
                              color: White,
                              fontsize: 20,
                              fontweight: FontWeight.w700,
                            ),
                          ],
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);

    /// get user data start///
    final currentuser = FirebaseAuth.instance.currentUser;
    final firebaseid = currentuser!.uid;
    final username = currentuser.displayName;
    final useremail = currentuser.email;
    final userphoto = currentuser.photoURL;
    log("firebaseid = $firebaseid");
    log("username = $username");
    log("useremail = $useremail");
    log("userphoto = $userphoto");
    var sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.setString("firebaseid", firebaseid);
    await sharedprefs.setString("username", username!);
    await sharedprefs.setString("useremail", useremail!);
    await sharedprefs.setString("userphoto", userphoto!);

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MasterPage()));

    /// get user data end///
  }
}
