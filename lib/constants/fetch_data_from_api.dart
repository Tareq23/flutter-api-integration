
import 'package:flutterapiconsume/constants/api_url.dart';
import 'package:flutterapiconsume/model/user.dart';
import 'package:flutterapiconsume/model/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class FetchApiData{
  static Future<UserModel> readUserData(int id) async
  {
    http.Response response = await http.get(Uri.parse(APIURL.SINGLE_USER+"$id"));
    var jsonData = json.decode(response.body);
    return UserModel.fromJson(jsonData);
  }

  static Future<AllUsersModel> readAllUserData() async
  {
    http.Response response = await http.get(Uri.parse(APIURL.LIST_USER));
      var jsonData = json.decode(response.body);
      return AllUsersModel.fromJson(jsonData);
  }
}