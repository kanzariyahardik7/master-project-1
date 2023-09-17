import 'package:flutter/material.dart';
import 'package:masterapp/pages/LoginPage.dart';
import 'package:masterapp/provider/userprovider.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:masterapp/ui_helper/constant.dart';
import 'package:masterapp/ui_helper/mytext.dart';
import 'package:masterapp/ui_helper/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("Profile"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("${Constant.userphoto}"),
                ),
              ],
            ),
            MyText(
              text: "FirebaseId : ${Constant.firebaseid}",
              color: Black,
              fontsize: 14,
              fontweight: FontWeight.w600,
            ),
            MyText(
              text: "Name : ${Constant.username}",
              color: Black,
              fontsize: 14,
              fontweight: FontWeight.w600,
            ),
            MyText(
              text: "Email :${Constant.useremail} ",
              color: Black,
              fontsize: 14,
              fontweight: FontWeight.w600,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var sharedprefs = await SharedPreferences.getInstance();
                    await sharedprefs.remove("username");
                    await sharedprefs.remove("userid");
                    await sharedprefs.remove("userimage");
                    await sharedprefs.remove("useremail");
                    await sharedprefs.remove("islogin");
                    final userprovider =
                        Provider.of<UserProvider>(context, listen: false);
                    await userprovider.googleLogout();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: MyText(
                    text: "Logout ",
                    color: White,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
