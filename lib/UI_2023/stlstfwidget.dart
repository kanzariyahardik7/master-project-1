import 'package:flutter/material.dart';
import 'package:photos/UI_2023/nextpage.dart';
import 'package:photos/ui_helper/utils.dart';

class incriment extends StatefulWidget {
  const incriment({Key? key}) : super(key: key);

  @override
  State<incriment> createState() => _incrimentState();
}

class _incrimentState extends State<incriment> {
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();
  var no3Controller = TextEditingController();
  var no4Controller = TextEditingController();
  var increment = 0;
  var Result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar("Increment Operator"),
        body: Container(
          decoration: BoxDecoration(gradient: Orange_Gradiant()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Text("Incriment = $increment"),
                ElevatedButton(
                    onPressed: () {
                      increment = increment + 1;
                      print(increment);

                      print("Ram");
                      setState(() {});
                    },
                    child: Text("Counter")),
                Divider(),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: no1Controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: no2Controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Result = int.parse(no1Controller.text.toString()) +
                              int.parse(no2Controller.text.toString());
                          setState(() {});
                        },
                        child: Text("+")),
                    ElevatedButton(
                        onPressed: () {
                          Result = int.parse(no1Controller.text.toString()) -
                              int.parse(no2Controller.text.toString());
                          setState(() {});
                        },
                        child: Text("-")),
                    ElevatedButton(
                        onPressed: () {
                          Result = int.parse(no1Controller.text.toString()) *
                              int.parse(no2Controller.text.toString());
                          setState(() {});
                        },
                        child: Text("*")),
                    ElevatedButton(
                        onPressed: () {
                          Result = int.parse(no1Controller.text.toString()) /
                              int.parse(no2Controller.text.toString());
                          setState(() {});
                        },
                        child: Text("/"))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Result = $Result"),
                Divider(),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: no3Controller,
                  decoration: InputDecoration(
                      labelText: "Enter your name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: no4Controller,
                  decoration: InputDecoration(
                      labelText: "Enter your mibile number",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NextPage(no3Controller.text.toString(),no4Controller.text.toString()),
                      ));
                    },
                    child: Text("Next Page"))
              ],
            ),
          ),
        ));
  }
}
