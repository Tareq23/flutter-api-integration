

import 'dart:developer';

import 'package:flutterapiconsume/model/user.dart';

class AllUsersModel{
  List<UserModel>? userList;


  AllUsersModel.fromJson(Map<String,dynamic>parsedJson)
  {
    var list = parsedJson['data'];
    // List<UserModel> _listUser = list.
    var _list = list.map((e) => UserModel.fromJson(e)).toList();
    userList = _list;
  }

}