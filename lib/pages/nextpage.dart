import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NextPage extends StatefulWidget {
  var namefromhome;
  var mobilefromhome;
  NextPage(this.namefromhome, this.mobilefromhome);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  RangeValues Slidervalues = RangeValues(0, 1);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(Slidervalues.start.toString(), Slidervalues.end.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("NextPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your name =${widget.namefromhome}"),
            Text("Your mobile number = ${widget.mobilefromhome}"),
            RangeSlider(
                values: Slidervalues,
                labels: labels,
                divisions: 10,
                onChanged: (newvalue) {
                  Slidervalues = newvalue;

                  setState(() {});
                })
          ],
        ),
      ),
    );
  }
}
