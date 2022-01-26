
import 'package:flutterapiconsume/constants/api_url.dart';
import 'package:flutterapiconsume/model/user.dart';
import 'package:flutterapiconsume/model/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class FetchApiData{




  static Future readUserData(int id) async
  {
    http.Response response = await http.get(Uri.parse(APIURL.SINGLE_USER+"$id"));
    if(response.statusCode == 200)
      {
        var jsonData = json.decode(response.body);
        return UserModel.fromJson(jsonData);
      }
    else {
      return "Check Your Net connect!";
    }
  }

  static Future readAllUserData() async
  {
    http.Response response = await http.get(Uri.parse(APIURL.LIST_USER));
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      return AllUsersModel.fromJson(jsonData);
    }
    else{
      return "Check Your Internet Connection";
    }
  }
}