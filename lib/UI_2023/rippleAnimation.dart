import 'package:flutter/material.dart';
import 'package:photos/ui_helper/utils.dart';

class rippleAnimation extends StatefulWidget {
  const rippleAnimation({Key? key}) : super(key: key);

  @override
  State<rippleAnimation> createState() => _rippleAnimationState();
}

class _rippleAnimationState extends State<rippleAnimation>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  var listradius = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {});
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar("Ripple Aniamtion"),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: listradius
                .map((radius) => Container(
                    width: radius * _animation.value,
                    height: radius * _animation.value,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(1.0 - _animation.value)
                    )
            )
            )
                .toList(),
          ),
        ));
  }
}
