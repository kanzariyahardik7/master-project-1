import 'package:flutter/material.dart';
import 'package:photos/Api/Api.dart';
import 'package:photos/Api/ApiScreen/Singlruser.dart';
import 'package:photos/Models/ListModel.dart';
import 'package:photos/ui_helper/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("Listing Page"),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ListUserModel>(
              future: UserList().userList(),
                builder: (context,snapshot){
                if(snapshot.hasData){
                  return  ListView.separated(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      var res = snapshot.data!.data![index];
                      print("-------------->>>>>>>>>>");
                      print(snapshot.data!.data!.length);
                      return InkWell(
                        onTap: () async{
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString('UserID', res.id.toString());

                          setState(() {
                            print(' ***************${'UserID'}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleUser()));
                          });
                        },
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            leading: InkWell(
                                onTap: () {
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 300,
                                          width: 300,
                                          child: Image.network(res.avatar.toString()),
                                        );
                                      }
                                  );
                                },
                                child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(res.avatar.toString()))),
                            title: Text(res.firstName.toString()+" "+res.lastName.toString()),
                            subtitle: Text(res.email.toString()),
                            trailing: Text(res.id.toString()),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  );
                }
                else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                else{
                  return Center(child: CircularProgressIndicator());
                }
            }
            ),
          ),
        ],
      ),
    );
  }
}




