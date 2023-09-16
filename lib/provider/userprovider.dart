import 'package:flutter/material.dart';
import 'package:masterapp/Api/Api.dart';
import 'package:masterapp/Models/SingleuserModel.dart';
import 'package:masterapp/Models/listuserModel.dart';

class UserProvider extends ChangeNotifier {
  bool loading = false;

  ListUserModel listUserModel = ListUserModel();
  SingleUserModel singleUserModel = SingleUserModel();

  getuserlist() async {
    loading = true;
    listUserModel = await ApiService().userList();
    loading = false;
    notifyListeners();
  }

  getSingleuser(String userid) async {
    loading = true;
    singleUserModel = await ApiService().singleuser(userid);
    loading = false;
    notifyListeners();
  }
}
