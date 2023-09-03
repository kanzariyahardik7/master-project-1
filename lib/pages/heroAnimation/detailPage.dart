import 'package:flutter/material.dart';
import 'package:photos/ui_helper/utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Detail Page"),
        // ),
        body: Container(
          decoration: BoxDecoration(gradient: Orange_Gradiant()),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                Hero(tag: "background", child: Image.asset("assets/images/maclern.jpg")),
                Text(
                  style:FONT_20_BOLD() ,
                    textAlign: TextAlign.justify,
                    "A technological masterpiece, it was the world's first carbon fibre road car, the world's fastest production car and is still the fastest naturally aspirated road car ever built. Chief designer Gordon Murray and his handpicked team deliberated every millimetre of the F1's design to create the world's most thrilling car.\n McLaren car price starts at Rs 3.72 Crore for the cheapest model which is GT and the price of most expensive model, which is 720S starts at Rs 4.65 Crore."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
