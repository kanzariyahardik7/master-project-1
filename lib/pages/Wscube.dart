import 'package:flutter/material.dart';
import 'package:masterapp/ui_helper/utils.dart';
import 'package:intl/intl.dart';

class WsCube extends StatefulWidget {
  const WsCube({Key? key}) : super(key: key);

  @override
  State<WsCube> createState() => _WsCubeState();
}

class _WsCubeState extends State<WsCube> {
  var NameController = TextEditingController();
  var MobileNumberController = TextEditingController();
  var EmailController = TextEditingController();

  var DropdwnList = [
    "USA",
    "INDIA",
    "AFRICA",
    "AUSTRALIYA",
    "RUSSIA",
    "ENGLAND",
    "SPAIN",
    "BRAZIL"
  ];

  @override
  Widget build(BuildContext context) {
    callbackfunction() {
      print("clicked");
    }

    var time = DateTime.now();
    var selectedDate;
    var selectedTime;
    return Scaffold(
      appBar: Custom_Appbar("Ws Cube"),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(gradient: Orange_Gradiant()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    children: [
                      Container(
                          child: TextField(
                              controller: NameController,
                              // enabled: false,
                              decoration: InputDecoration(
                                  // hintText: "Enter Name",
                                  // hintStyle: TextStyle(color: Colors.pink),
                                  labelText: "Enter Name",
                                  //labelStyle: TextStyle(color: Colors.pink),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                    ),
                                  ),
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.account_box,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(width: 2))))),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: MobileNumberController,
                              // enabled: false,
                              decoration: InputDecoration(
                                  // hintText: "Enter your mobile number",
                                  // hintStyle: TextStyle(color: Colors.pink),
                                  labelText: "Enter your mobile number",
                                  // labelStyle: TextStyle(color: Colors.pink),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                    ),
                                  ),
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.phone_android,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(width: 2))))),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          child: TextField(
                              controller: EmailController,
                              // enabled: false,
                              decoration: InputDecoration(
                                  // hintText: "Enter your Email",
                                  // hintStyle: TextStyle(color: Colors.pink),
                                  labelText: "Enter your Email",
                                  // labelStyle: TextStyle(color: Colors.pink),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                    ),
                                  ),
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.mail,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(width: 2))))),
                      ElevatedButton(
                          onPressed: () {
                            String YourName = NameController.text.toString();
                            String YourMobileNumber =
                                MobileNumberController.text.toString();
                            String YourEmail = EmailController.text.toString();
                            setState(() {});
                          },
                          child: Text("Submitt")),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Name = ${NameController.text.toString()}"),
                          Text(
                              "Your Mobile Number = ${MobileNumberController.text.toString()}"),
                          Text(
                              "Your Email = ${EmailController.text.toString()}"),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
                ElevatedButton(
                    onPressed: () async {
                      DateTime? datePicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2025));
                      if (datePicked != null) {
                        selectedDate =
                            datePicked.day / datePicked.month / datePicked.year;
                        print(selectedDate);
                        print(
                            "===========>>>>>> = ${datePicked.day}/${datePicked.month}/${datePicked.year}");
                      } else {
                        print("please select date");
                      }
                      setState(() {});
                    },
                    child: Text("Select Date")),
                Text("Your selected date :", style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.input);

                      if (pickedTime != null) {
                        print(
                            "===========>>>>>> = ${pickedTime.hour}:${pickedTime.minute}");
                      }
                      setState(() {});
                    },
                    child: Text("Select Time")),
                Text("Your Selected Time : ", style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 25,
                ),
                Divider(),
                TextButton(onPressed: () {}, child: Text("Text Button")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("A",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text("B",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text("C",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text("D",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    print("ontap");
                  },
                  onDoubleTap: () {
                    print("doubletap");
                  },
                  onLongPress: () {
                    print("longpress");
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 200,
                      child: Center(
                          child: Text("CONTAINER",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      //border: Border.all(width: 2,color: Colors.black),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          //border: Border.all(width: 1,color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 11,
                                spreadRadius: 7,
                                color: Colors.grey)
                          ]),
                    )),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Divider(),
                Text("Current Date= ${time.day}/${time.month}/${time.year}"),
                Text(
                    "Current Time= ${time.hour}:${time.minute}:${time.second}"),
                if (time.weekday == 1) ...[
                  Text("Monday")
                ] else if (time.weekday == 2) ...[
                  Text("Tuesday")
                ] else if (time.weekday == 3) ...[
                  Text("Wednesday")
                ] else if (time.weekday == 4) ...[
                  Text("Thursday")
                ] else if (time.weekday == 5) ...[
                  Text("Friday")
                ] else if (time.weekday == 6) ...[
                  Text("Saturday")
                ] else if (time.weekday == 7) ...[
                  Text("Sanbday")
                ],
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text(
                    "Current Date & Time",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text("Current Date= ${DateFormat("yMMMMEEEEd").format(time)}"),
                Text("Current Time= ${DateFormat("Hms").format(time)}"),
                SizedBox(
                  height: 50,
                ),
                Divider(),
                ElevatedButton(
                    onPressed: callbackfunction,
                    child: Text("Call Back Button"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
