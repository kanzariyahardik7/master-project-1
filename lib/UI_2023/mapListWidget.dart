import 'package:flutter/material.dart';
import 'package:photos/ui_helper/utils.dart';

class mapList extends StatefulWidget {
  const mapList({Key? key}) : super(key: key);

  @override
  State<mapList> createState() => _mapListState();
}

class _mapListState extends State<mapList> {
  var nameList = ["Hardik","Nayan","Monika","Anjali","Janvi","Divyang","Miral","Khushi","Priyansh","Rahul","Swara","Rahul","Rohit","Jinesh"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("Mapping Listview"),
      body: Container(
        child: ListView(
          children:
            nameList.map((e) {
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(elevation: 5,child: Container(height: 50,child: Center(child: Text(e)),)),
              );
            }
            ).toList(),
        ),
      ),
    );
  }
}
