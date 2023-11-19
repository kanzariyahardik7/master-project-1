import 'dart:async';

import 'package:flutter/material.dart';
import 'package:masterapp/ui_helper/utils.dart';

class AnmContainer extends StatefulWidget {
  const AnmContainer({Key? key}) : super(key: key);

  @override
  State<AnmContainer> createState() => _AnmContainerState();
}

class _AnmContainerState extends State<AnmContainer> {
  var _height = 100.00;
  var _width = 200.00;
  var myOpacity = 1.0;

  bool flag = true;
  bool isVisible = true;
  bool isFirst = true;
  Color bgColor = Colors.yellow;

  Decoration myDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.yellow,
  );

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      reload();
    });
  }

  void reload() {
    setState(() {
      isFirst = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar(appbartitle: "Foo Animation"),
        body: Container(
          decoration: BoxDecoration(gradient: Orange_Gradiant()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    AnimatedContainer(
                      curve: Curves.bounceOut,
                      duration: Duration(seconds: 1),
                      width: _width,
                      height: _height,
                      decoration: myDecoration,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (flag) {
                            _height = 200.00;
                            _width = 100.00;
                            myDecoration = BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.red);
                            flag = false;
                          } else {
                            _height = 100.00;
                            _width = 200.00;
                            myDecoration = BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.yellow);
                            flag = true;
                          }
                          setState(() {});
                        },
                        child: Text("Animate")),
                    SizedBox(
                      height: 30,
                    ),

                    ///###########33###############################################################
                    AnimatedOpacity(
                      opacity: myOpacity,
                      duration: Duration(seconds: 1),
                      child: Container(
                        height: 100.00,
                        width: 200.00,
                        color: Colors.blue,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (isVisible) {
                            myOpacity = 0.0;
                            isVisible = false;
                          } else {
                            myOpacity = 1.0;
                            isVisible = true;
                          }
                          setState(() {});
                        },
                        child: Text("Opacity Change")),

                    ///########################################################################
                    SizedBox(
                      height: 30,
                    ),
                    AnimatedCrossFade(
                        firstChild: Container(
                          height: 200.0,
                          width: 200.0,
                          color: Colors.purple,
                        ),
                        secondChild: Image.asset(
                          "assets/images/maclern.jpg",
                          height: 200.0,
                          width: 200.0,
                          fit: BoxFit.cover,
                        ),
                        crossFadeState: isFirst
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: Duration(seconds: 1)),
                    ElevatedButton(
                        onPressed: () {
                          if (isFirst) {
                            isFirst = false;
                          } else {
                            isFirst = true;
                          }

                          setState(() {});
                        },
                        child: Text("Cross Fade"))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
