import 'package:flutter/material.dart';
import 'package:photos/pages/masterpage.dart';
import 'package:photos/pages/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_sharp),
                  labelText: "Mobile number",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: "Password",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var sharedprefs = await SharedPreferences.getInstance();
                    sharedprefs.setBool(SplashScreenState.KEYLOGIN, true);

                    print(SplashScreenState.KEYLOGIN);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MasterPage()));
                  },
                  child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
