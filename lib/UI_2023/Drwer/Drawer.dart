import 'package:flutter/material.dart';
import 'package:photos/UI_2023/Drwer/photopage.dart';
import 'package:photos/ui_helper/utils.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Orange_Gradiant()),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                      color: Colors.green.shade400,
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoPage(),));
                        },
                        child: Hero(
                          tag: "Profilephoto",
                          child: Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                //color: Colors.red,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/myphoto.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Hardik Kanzariya",
                        style: Info_bold_style(),
                      ),
                      Text(
                        "(Flutter developer)",
                        style: Info_regular_style(),
                      ),
                    ],
                  )
                ],
              ),
              Divider(thickness: 3),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.school),
                      SizedBox(width: 20,),
                      Text("Educational details", style: Info_bold_style()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 20,),
                      Text("Settings",style: Info_bold_style(),),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
