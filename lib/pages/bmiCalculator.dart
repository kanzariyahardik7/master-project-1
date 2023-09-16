import 'package:flutter/material.dart';
import 'package:masterapp/ui_helper/utils.dart';

class BmiCalculator extends StatefulWidget {
  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";
  var bgcolor = Colors.blueGrey;
  var message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("BMI Calclulator"),
      body: Container(
        color: bgcolor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            //physics: BouncingScrollPhysics,
            children: [
              Text(
                "BMI",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Enter your weight in kg",
                    suffixText: "Kg.",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: feetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Enter your height in  feet",
                    suffixText: "feet.",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: inchController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Enter your height in inch",
                    suffixText: "inch.",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11))),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    var weight = weightController.text.toString();
                    var feet = feetController.text.toString();
                    var inch = inchController.text.toString();

                    if (weight != "" || feet != "" || inch != "") {
                      var intweight = int.parse(weight);
                      var intfeet = int.parse(feet);
                      var intinch = int.parse(inch);

                      var totalinch = (intfeet * 12) + intinch;
                      var totalcm = totalinch * 2.54;
                      var totalmeter = totalcm / 100;

                      var Bmi = intweight / (totalmeter * totalmeter);

                      if (Bmi > 25) {
                        message = "you are over weighted";
                        bgcolor = Colors.red;
                      } else if (Bmi < 18) {
                        message = "you are under weighted";
                        bgcolor = Colors.yellow;
                      } else {
                        message = "you are healthy";
                        bgcolor = Colors.green;
                      }
                      result =
                          "$message \n Your BMI is ${Bmi.toStringAsFixed(2)}";

                      print("=================????????$totalmeter");
                      print("=================>>>>>>>>$result");
                      setState(() {});
                    } else {
                      result = "Please fill all the required blanks";
                      setState(() {});
                    }
                  },
                  child: Text("Calculate")),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
