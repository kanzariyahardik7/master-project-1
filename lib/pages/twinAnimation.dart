import 'package:flutter/material.dart';
import 'package:masterapp/ui_helper/utils.dart';

class twinAnimation extends StatefulWidget {
  const twinAnimation({Key? key}) : super(key: key);

  @override
  State<twinAnimation> createState() => _twinAnimationState();
}

class _twinAnimationState extends State<twinAnimation>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation ColorAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
    ColorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellowAccent)
        .animate(animationController);

    animationController.addListener(() {
      print(animation.value);
      setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar(appbartitle: "Twin Animation"),
      body: Container(
        decoration: BoxDecoration(gradient: Orange_Gradiant()),
        child: Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            color: ColorAnimation.value,
          ),
        ),
      ),
    );
  }
}
