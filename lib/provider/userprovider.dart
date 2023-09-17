import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masterapp/Api/Api.dart';
import 'package:masterapp/Models/SingleuserModel.dart';
import 'package:masterapp/Models/listuserModel.dart';
import 'package:masterapp/ui_helper/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  bool loading = false;

  ListUserModel listUserModel = ListUserModel();
  SingleUserModel singleUserModel = SingleUserModel();

  getuserlist() async {
    loading = true;
    listUserModel = await ApiService().userList();
    loading = false;
    notifyListeners();
  }

  getSingleuser(String userid) async {
    loading = true;
    singleUserModel = await ApiService().singleuser(userid);
    loading = false;
    notifyListeners();
  }

  /// *  google signIn  *///

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

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

    Constant.firebaseid = await sharedprefs.getString("firebaseid");
    Constant.username = await sharedprefs.getString("username");
    Constant.useremail = await sharedprefs.getString("useremail");
    Constant.userphoto = await sharedprefs.getString("userphoto");

    /// get user data end///

    notifyListeners();
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
