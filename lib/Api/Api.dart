import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:photos/Models/DeleteUserModel.dart';
import 'package:photos/Models/EditUserModel.dart';
import 'package:photos/Models/ListModel.dart';
import 'package:photos/Models/SingleuserModel.dart';
import 'package:photos/Models/addUserModel.dart';


const String Baseurl = "https://reqres.in/";

//https://reqres.in/api/users/7


// class ApiService{
//
//   String uri= "https://reqres.in/api/users?page=2";
//
//   Future<ListUserModel> getUser() async {
//     var response = await http.get(Uri.parse(uri));
//
//   }
//
// }



class UserList{
  UserList();
  Future<ListUserModel>userList() async{
    var uri = Baseurl+"api/users?page=2";
    http.Response response = await http.get(Uri.parse(uri),
      );
    var data = json.decode(response.body);
    print("UserList"+(response.body));
    return ListUserModel.fromJson(data);
  }
}


class SigleUserList{
  SigleUserList();
  Future<SingleUserModel>singleuserList(userid) async{
    var uri = Baseurl+"api/users/${userid}";
    http.Response response = await http.get(Uri.parse(uri),);
    var data = json.decode(response.body);
    print("SingleUserList"+(response.body));
    return SingleUserModel.fromJson(data);
  }
}


class AddUser{
  AddUser();
  Future<AddUserModel>adduserList(name,job) async{
    var uri = Baseurl + "api/users/7";
    http.Response response = await http.post(Uri.parse(uri),body:{
      "name": name,
      "job": job,
    });
    var data = json.decode(response.body);
    print("Added User"+response.body);
    return AddUserModel.fromJson(data);
  }
}

class EditUser{
  EditUser();
  Future<EditUserModel>edituserList(name,job) async{
    var uri = Baseurl + "api/users/7";
    http.Response response = await http.put(Uri.parse(uri),body:{
      "name": name,
      "job": job,
    });
    var data = json.decode(response.body);
    print("Updated User"+response.body);
    return EditUserModel.fromJson(data);
  }
}

class DeleteUser{
  DeleteUser();
  Future<DeleteUserModel>deleteuserList(id) async{
    var uri = Baseurl + "api/users/7";
    http.Response response = await http.delete(Uri.parse(uri),body:{
      "id": id,
    });
    var data = json.decode(response.body);
    print("Deleted User"+response.body);
    return DeleteUserModel.fromJson(data);
  }
}
  //
  // Future<ListUserModel> getPosts() async{
  //   var client = http.Client();
  //   var uri = Uri.parse("https://reqres.in/api/users?page=2");
  //   var response = await client.get(uri);
  //
  //   if(response.statusCode == 200){
  //     var json = response.body;
  //     return data = ListUserModelFromJson(json);
  //   }
  //
  // }



//
// class UserList{
//   UserList();
//   Future<ListUserModel?> userlist() async{
//     var url = "https://reqres.in/api/users?page=2";
//     http.Response response = await http.get(Uri.parse(url),);
//     var data = response.body;
//     print("hardik"+data);
//
//     if(response.statusCode == 200){
//       var data = jsonDecode(response.body);
//       ListUserModel.fromJson(data);
//     }else
//       return null;
//   }
// }



// void main(List<String> arguments) async {
//   // This example uses the Google Books API to search for books about http.
//   // https://developers.google.com/books/docs/overview
//   var url = Uri.https("https://reqres.in/api/users?page=2");
//
//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     var jsonResponse =
//     convert.jsonDecode(response.body) as Map<String, dynamic>;
//     var itemCount = jsonResponse['totalItems'];
//     print('Number of books about http: $itemCount.');
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }



// Future<List<ListUserModel>> getUserApi () async{
//   final response = await http.get(Uri.parse("https://reqres.in/api/users?page = 2"));
//   var data = jsonDecode(response.body.toString());
//
//   if(response.statusCode == 200){
//     for(Map i in data){
//       userlist.add(ListUserModel.fromJson(i));
//     }
//     return userlist;
//   }
//   else{
//     return userlist;
//   }
// }