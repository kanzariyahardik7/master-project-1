import 'package:flutter/material.dart';
import 'package:photos/ui_helper/utils.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("Custom Widget"),
      body: Column(
        children: [
          StoryMenu(),
          SizedBox(height: 10,),
          BodyMenu(),
          SizedBox(height: 10,),
          ItemMenu(),
          SizedBox(height: 10,),
          BottomMenu()
        ],
      ),
    );
  }
}


class StoryMenu extends StatelessWidget {
  const StoryMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            color: Colors.yellowAccent,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  );
                })
        )
    );
  }
}

class BodyMenu extends StatelessWidget {
  const BodyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        flex: 4,
        child: Container(
          color: Colors.purpleAccent,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/profile.jpeg"),
                    //backgroundColor: Colors.red,
                  ),
                  title: Text("Name"),
                  trailing: Icon(Icons.access_time),
                  subtitle: Text("About"),
                );
              }),
        ));
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.red,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Container(
                        width: 90,
                        color: Colors.green,
                      )
                  ),
                );
              }),
        )
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          color: Colors.blue,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Container(
                        width: 90,
                        color: Colors.green,
                      )
                  ),
                );
              }),
        )
    );
  }
}

