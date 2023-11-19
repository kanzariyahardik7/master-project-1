import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:masterapp/ui_helper/constant.dart';
import 'package:masterapp/ui_helper/mytext.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'masterpage.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText(
            text: "Please enter OTP",
            color: Black,
            fontsize: 30,
            fontweight: FontWeight.w600,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  // color: Red,
                  child: Pinput(
                    defaultPinTheme: PinTheme(
                        textStyle: TextStyle(
                            color: White,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                            color: Black.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10))),
                    length: 6,
                    controller: otpController,
                  ),
                ),
              ),
            ],
          ),
          MyText(
            text: "your OTP = ${otpController.text}",
            color: Black,
            fontsize: 25,
            fontweight: FontWeight.w500,
          ),
          InkWell(
            onTap: () async {
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: Constant.verficationId,
                    smsCode: "${otpController.text}");
                await auth.signInWithCredential(credential);
                log("===>**");
                var sharedprefs = await SharedPreferences.getInstance();
                await sharedprefs.setString("islogin", "yes");
                var read = await sharedprefs.getString("islogin");
                log("===>$read");
                if (read == "yes") {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MasterPage()),
                    (route) {
                      return false;
                    },
                  );
                }
              } catch (e) {
                log("wrong otp");
                SnackBar(content: MyText(text: "wrong OTP", color: Black));
              }
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: Black, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: MyText(
                    text: "Verifye OTP",
                    color: White,
                    fontsize: 20,
                    fontweight: FontWeight.w700,
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
