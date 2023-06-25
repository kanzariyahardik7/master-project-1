import 'package:flutter/material.dart';
import 'package:photos/ui_helper/Widgets/rounded_btn.dart';
import 'package:photos/ui_helper/utils.dart';



class CustomWidget2 extends StatefulWidget {
  const CustomWidget2({Key? key}) : super(key: key);

  @override
  State<CustomWidget2> createState() => _CustomWidget2State();
}

class _CustomWidget2State extends State<CustomWidget2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("CustomWidget_2"),
      // AppBar(
      //   title: Text("CustomWidget_2"),
      // ),
      body: Container(
        decoration: BoxDecoration(gradient: Orange_Gradiant()),
        child: Center(
          child: Container(
            width: 150,
            child: RundedBtn(
              callback: (){print("cjasdakdakj==============");},
                btnName: "Hello",
              //btnColor: Colors.green,
              btnIcon: Icon(Icons.ac_unit_outlined),
            ),
          ),
        ),
      ),

    );;
  }
}
