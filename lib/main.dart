import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masterapp/pages/splashscreen.dart';
import 'package:masterapp/provider/userprovider.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        theme: ThemeData(
          primaryColor: Black,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
