import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DeshboardPage extends StatefulWidget {
  @override
  State<DeshboardPage> createState() => _DeshboardPageState();
}

class _DeshboardPageState extends State<DeshboardPage> {
  bool _isEleveted = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isEleveted = !_isEleveted;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          boxShadow:
                          _isEleveted ?
                          [
                            BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 20),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-10.0, -10.0),
                              blurRadius: 20.0,
                            )
                          ]
                              : null
                      ),
                      child: Icon(
                        Icons.verified_sharp,
                        size: 130,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow:
                        [
                          BoxShadow(
                              offset: Offset(10, 10),
                              color: Colors.black38,
                              blurRadius: 20),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-10.0, -10.0),
                            blurRadius: 20.0,
                          )
                        ]
                    ),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      //maxLength: 10,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: Icon(Icons.mobile_screen_share,color: Colors.black,),
                        labelText: "Mobile No.",
                        labelStyle: TextStyle(
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow:
                        [
                          BoxShadow(
                              offset: Offset(10, 10),
                              color: Colors.black38,
                              blurRadius: 20),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-10.0, -10.0),
                            blurRadius: 20.0,
                          )
                        ]
                    ),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      //maxLength: 10,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: Icon(Icons.password,color: Colors.black,),
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: (){
                     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ,));
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow:
                          //_isEleveted ?
                          [
                            BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 20),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-10.0, -10.0),
                              blurRadius: 20.0,
                            )
                          ]
                        // : null
                      ),
                      child: Center(child: Text("Sign In",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
