import 'package:flutter/material.dart';
import 'package:photos/UI_2023/heroAnimation/detailPage.dart';
import 'package:photos/ui_helper/utils.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("Hero Animation"),
      body: Container(
        decoration: BoxDecoration(gradient: Orange_Gradiant()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(),));
                },
                child: Hero(
                    tag: "background",
                    child: Image.asset("assets/images/maclern.jpg",)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
