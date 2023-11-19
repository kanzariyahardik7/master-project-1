import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:masterapp/ui_helper/mytext.dart';
import 'package:masterapp/ui_helper/utils.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar(
        appbartitle: "Language",
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _buildLanaguageButton(
                ontap: () {
                  log("english");
                  Locales.change(context, 'en');
                },
                name: "english"),
            _buildLanaguageButton(
                ontap: () {
                  log("hindi");
                  Locales.change(context, 'hi');
                },
                name: "hindi"),
            _buildLanaguageButton(
                ontap: () {
                  log("gujrati");
                  Locales.change(context, 'gu');
                },
                name: "gujrati"),
          ],
        ),
      ),
    );
  }

  Widget _buildLanaguageButton(
      {required Function()? ontap, required String? name}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 100,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: Black),
        child: Center(
          child: MyText(
            text: name!,
            color: White,
            fontsize: 20,
            multilanguage: true,
            fontweight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
