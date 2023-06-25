import 'package:flutter/material.dart';
import 'package:photos/Api/Api.dart';
import 'package:photos/Models/DeleteUserModel.dart';
import 'package:photos/Models/EditUserModel.dart';
import 'package:photos/Models/SingleuserModel.dart';
import 'package:photos/Models/addUserModel.dart';
import 'package:photos/ui_helper/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleUser extends StatefulWidget {
  const SingleUser({Key? key}) : super(key: key);

  @override
  State<SingleUser> createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  late String userid;

  late AddUserModel _AddUserModel;
  late EditUserModel _EditUserModel;
  late DeleteUserModel _DeleteUserModel;

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = (prefs.getString('UserID'))!;
    print("---->userid  " + userid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar("Single User page"),
      body: FutureBuilder<SingleUserModel>(
          future: SigleUserList().singleuserList(userid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    var res = snapshot.data!.data!;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return Container(
                                            height: 1000,
                                            width: 1000,
                                            child: Image.network(
                                                res.avatar.toString()),
                                          );
                                        });
                                  },
                                  child: CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          NetworkImage(res.avatar.toString()))),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "UserId : ${res.id}",
                            style: FONT_15_BOLD(),
                          ),
                          Text(
                            "Name : ${res.firstName.toString()} ${res.lastName.toString()}",
                            style: FONT_15_BOLD(),
                          ),
                          Text(
                            "Email : ${res.email}",
                            style: FONT_15_BOLD(),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String name = res.firstName.toString() +
                                        " " +
                                        res.lastName.toString();
                                    String job = res.email.toString();

                                    AddUserModel? data =
                                        await AddUser().adduserList(name, job);
                                    setState(() {
                                      _AddUserModel = data;
                                    });

                                    print("Succesfuly Added");
                                  },
                                  child: Text("Add"),
                                ),
                              ),
                              Container(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String name = res.firstName.toString() +
                                        " " +
                                        res.lastName.toString();
                                    String job = res.email.toString();

                                    EditUserModel? data = await EditUser()
                                        .edituserList(name, job);
                                    setState(() {
                                      _EditUserModel = data;
                                    });

                                    print("Succesfuly Updated");
                                  },
                                  child: Text("Update"),
                                ),
                              ),
                              Container(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String id = res.id.toString();
                                    DeleteUserModel? data =
                                        await DeleteUser().deleteuserList(id);
                                    setState(() {
                                      _DeleteUserModel = data;
                                    });

                                    print("Succesfuly Deleted");
                                  },
                                  child: Text("Delete"),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
