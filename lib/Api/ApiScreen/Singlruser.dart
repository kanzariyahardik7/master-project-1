import 'package:flutter/material.dart';
import 'package:photos/provider/userprovider.dart';
import 'package:photos/ui_helper/utils.dart';
import 'package:provider/provider.dart';

class SingleUser extends StatefulWidget {
  final String? userid;
  SingleUser({required this.userid});
  @override
  State<SingleUser> createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  @override
  void initState() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getSingleuser(widget.userid ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar("Single User page"),
        body: Consumer<UserProvider>(
          builder: (context, singleuserData, child) {
            return singleuserData.loading
                ? Container()
                : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
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
                                                  "${singleuserData.singleUserModel.data?.avatar}"),
                                            );
                                          });
                                    },
                                    child: CircleAvatar(
                                        radius: 70,
                                        backgroundImage: NetworkImage(
                                            "${singleuserData.singleUserModel.data?.avatar}"))),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "UserId : ${singleuserData.singleUserModel.data!.id}",
                              style: FONT_15_BOLD(),
                            ),
                            Text(
                              "Name : ${singleuserData.singleUserModel.data!.firstName} ${singleuserData.singleUserModel.data!.lastName}",
                              style: FONT_15_BOLD(),
                            ),
                            Text(
                              "Email : ${singleuserData.singleUserModel.data!.email}",
                              style: FONT_15_BOLD(),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      // String name = res.firstName.toString() +
                                      //     " " +
                                      //     res.lastName.toString();
                                      // String job = res.email.toString();

                                      // AddUserModel? data =
                                      //     await AddUser().adduserList(name, job);
                                      // setState(() {
                                      //   _AddUserModel = data;
                                      // });

                                      print("Succesfuly Added");
                                    },
                                    child: Text("Add"),
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      // String name = res.firstName.toString() +
                                      //     " " +
                                      //     res.lastName.toString();
                                      // String job = res.email.toString();

                                      // EditUserModel? data = await EditUser()
                                      //     .edituserList(name, job);
                                      // setState(() {
                                      //   _EditUserModel = data;
                                      // });

                                      print("Succesfuly Updated");
                                    },
                                    child: Text("Update"),
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      // String id = res.id.toString();
                                      // DeleteUserModel? data =
                                      //     await DeleteUser().deleteuserList(id);
                                      // setState(() {
                                      //   _DeleteUserModel = data;
                                      // });

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
          },
        ));
  }
}
