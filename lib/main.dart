import 'package:flutter/material.dart';
import 'package:photos/UI_2023/masterpage.dart';
import 'package:photos/UI_2023/splashscreen.dart';

void main() {
  runApp(const CloudFileManagerUI());
}

class CloudFileManagerUI extends StatefulWidget {
  const CloudFileManagerUI({Key? key}) : super(key: key);

  @override
  State<CloudFileManagerUI> createState() => _CloudFileManagerUIState();
}

class _CloudFileManagerUIState extends State<CloudFileManagerUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Master App",
      theme: ThemeData(
          //primaryColor: Colors.orange,
          primarySwatch: Colors.orange),
      home: SplashScreen(),
    );
  }
}
