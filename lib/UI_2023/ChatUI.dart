import 'package:flutter/material.dart';
import 'package:photos/ui_helper/utils.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({Key? key}) : super(key: key);

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {

   var NameList = ["Hardik","Nayan","Monika","Anjali","Janvi","Divyang","Miral","Khushi","Priyansh","Rahul","Swara"];
   var AboutName = ["Flutter Developer","Computer Science Student",""];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("Chat UI"),
      body: Container(
        decoration: BoxDecoration(gradient: Orange_Gradiant()),
        child: ListView.separated(
          itemBuilder:(context,index){
          return Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/profile.jpeg"),
                //backgroundColor: Colors.red,
              ),
              title: Text(NameList[index]),
              subtitle: Text("About..."),
              trailing: Icon(Icons.add),
            ),
          ); },
            separatorBuilder: (context,index){
            return Divider(height: 4,thickness: 2,);
    },
            itemCount: NameList.length,
        ),
      ),
    );
  }
}



