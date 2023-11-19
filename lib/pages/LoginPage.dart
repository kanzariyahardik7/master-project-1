import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:masterapp/pages/masterpage.dart';
import 'package:masterapp/pages/otp.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:masterapp/ui_helper/constant.dart';
import 'package:masterapp/ui_helper/dimentions.dart';
import 'package:masterapp/ui_helper/mytext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  String? compliteNumber;

  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                /*  login text  */
                loginText(),
                SizedBox(height: screenHeight(context) * 0.18),

                /*  phone field  */
                phoneField(),
                SizedBox(height: screenHeight(context) * 0.03),

                /*  get OTP button  */
                otpButton(),
                SizedBox(height: screenHeight(context) * 0.03),

                /*  sign-In with google button  */
                googleSigninButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginText() {
    return Align(
      alignment: Alignment.topCenter,
      child: MyText(
        text: "loginPage",
        color: Black,
        fontsize: 30,
        fontweight: FontWeight.w700,
      ),
    );
  }

  Widget phoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: "Phone :",
          color: Black,
          fontsize: 20,
          fontweight: FontWeight.w400,
        ),
        IntlPhoneField(
          controller: phoneController,
          showDropdownIcon: false,
          showCountryFlag: false,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Green),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Black),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Black),
            ),
          ),
          initialCountryCode: 'IN',
          style: TextStyle(color: Black, fontWeight: FontWeight.w500),
          cursorColor: Black,
          dropdownTextStyle:
              TextStyle(color: Black, fontWeight: FontWeight.w600),
          onChanged: (phone) {
            compliteNumber = phone.completeNumber;
            log(compliteNumber!);
          },
        ),
      ],
    );
  }

  Widget googleSigninButton() {
    return InkWell(
        onTap: () async {
          log("===>**");
          var sharedprefs = await SharedPreferences.getInstance();
          await sharedprefs.setString("islogin", "yes");
          openGoogleLogin();
        },
        child: Container(
            height: MediaQuery.of(context).size.height * 0.065,
            decoration: BoxDecoration(
                color: Black, borderRadius: BorderRadius.circular(15)),
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
            )));
  }

  Widget otpButton() {
    return InkWell(
        onTap: () async {
          log("$compliteNumber");
          getOtp();
        },
        child: Container(
            height: screenHeight(context) * 0.065,
            decoration: BoxDecoration(
                color: Black, borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: MyText(
              text: "Get OTP",
              color: White,
              fontsize: 20,
              fontweight: FontWeight.w700,
            ))));
  }

  getOtp() async {
    return await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "$compliteNumber",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          Constant.verficationId = verificationId;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => OTP()));
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future openGoogleLogin() async {
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
