import 'package:flutter/material.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Hero(
          tag: "Profilephoto",
          child: Image.asset("assets/images/myphoto.jpg"),
        ),
      ),
    );
  }
}
