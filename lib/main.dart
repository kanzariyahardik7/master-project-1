import 'package:flutter/material.dart';
import 'package:photos/UI_2023/splashscreen.dart';
import 'package:photos/provider/userprovider.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Master App",
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: SplashScreen(),
      ),
    );
  }
}
