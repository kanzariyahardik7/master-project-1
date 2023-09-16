import 'package:flutter/material.dart';

Padding CustomContainer(String projectname) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
    child: Container(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text("$projectname",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        ),
      ),
    ),
  );
}
