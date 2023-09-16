import 'package:flutter/material.dart';
import 'package:masterapp/pages/Singlruser.dart';
import 'package:masterapp/provider/userprovider.dart';
import 'package:masterapp/ui_helper/utils.dart';
import 'package:provider/provider.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  var res;
  @override
  void initState() {
    getApi();
    super.initState();
  }

  getApi() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.getuserlist();
    res = userProvider.listUserModel.toJson();
    // print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar("Listing Page"),
        body: Consumer<UserProvider>(
          builder: (context, value, child) {
            return value.loading
                ? Container()
                : Column(
                    children: [
                      Expanded(
                          child: ListView.separated(
                        itemCount: value.listUserModel.data!.length,
                        itemBuilder: (context, index) {
                          print("-------------->>>>>>>>>>");
                          return InkWell(
                            onTap: () {
                              var userid = value.listUserModel.data?[index].id;
                              print(' ***************${'userid'}');
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SingleUser(
                                        userid: userid.toString(),
                                      )));
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
                                              child: Image.network(
                                                  "${value.listUserModel.data?[index].avatar.toString()}"),
                                            );
                                          });
                                    },
                                    child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            "${value.listUserModel.data?[index].avatar.toString()}"))),
                                title: Text(
                                    "${value.listUserModel.data?[index].firstName}" +
                                        " " +
                                        "${value.listUserModel.data?[index].firstName}"),
                                subtitle: Text("email"),
                                trailing: Text(
                                    "${value.listUserModel.data?[index].id}"),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                      )),
                    ],
                  );
          },
        ));
  }
}
