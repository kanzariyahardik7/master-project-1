import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:masterapp/pages/splashscreen.dart';
import 'package:masterapp/provider/userprovider.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Locales.init(['en', 'hi', 'gu']);
  runApp(const CloudFileManagerUI());
}

class CloudFileManagerUI extends StatelessWidget {
  const CloudFileManagerUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ],
        child: LocaleBuilder(
          builder: (locale) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Master App",
            localizationsDelegates: Locales.delegates,
            supportedLocales: Locales.supportedLocales,
            locale: locale,
            theme: ThemeData(
              primaryColor: Black,
            ),
            home: SplashScreen(),
          ),
        ));
  }
}
