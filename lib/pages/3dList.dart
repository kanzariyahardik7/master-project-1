import 'package:flutter/material.dart';
import 'package:photos/ui_helper/utils.dart';

class ThreeDList extends StatefulWidget {
  const ThreeDList({Key? key}) : super(key: key);

  @override
  State<ThreeDList> createState() => _ThreeDListState();
}

class _ThreeDListState extends State<ThreeDList> {
  var numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("3D List"),
      body: Container(
        decoration: BoxDecoration(gradient: Orange_Gradiant()),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: ListWheelScrollView(
            itemExtent: 100,
            children: numberList.map((value) => Container(
                      width: double.infinity,
              child: Center(child: Text("$value",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold),)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.orange
              ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
