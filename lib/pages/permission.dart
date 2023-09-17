import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:masterapp/ui_helper/colors.dart';
import 'package:masterapp/ui_helper/mytext.dart';
import 'package:permission_handler/permission_handler.dart';

class Permissionn extends StatefulWidget {
  const Permissionn({super.key});

  @override
  State<Permissionn> createState() => _PermissionnState();
}

class _PermissionnState extends State<Permissionn> {
  late InAppWebViewController _webViewController;
  String url = "";
  double _progress = 0;
  @override
  void initState() {
    List permission = [
      checkPermission(Permission.locationWhenInUse, context),
      checkPermission(Permission.camera, context),
      checkPermission(Permission.microphone, context),
      checkPermission(Permission.manageExternalStorage, context)
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Custom_Appbar("Permission"),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest:
              URLRequest(url: Uri.parse("https://www.google.com/search?q=")),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
          },
          onProgressChanged: (InAppWebViewController controller, int progress) {
            setState(() {
              _progress = progress / 100;
            });
          },
        ),
      ),
    );
  }

  Future<void> checkPermission(
      Permission permission, BuildContext context) async {
    final status = await permission.request();

    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: MyText(text: "Permission is granted", color: White),
        backgroundColor: Black,
      ));
    } else {
      // openAppSettings();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: MyText(text: "Permission is not granted", color: White),
        backgroundColor: Black,
      ));
    }
  }
}
