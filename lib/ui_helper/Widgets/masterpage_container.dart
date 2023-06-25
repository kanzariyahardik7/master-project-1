import 'package:flutter/material.dart';

Padding CustomContainer(String projectname){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 60,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Name : $projectname",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )

              ),
            ],
          ),
        ),
      ),
    ),
  );
}


