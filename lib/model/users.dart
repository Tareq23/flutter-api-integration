
import 'package:flutterapiconsume/model/user.dart';

class AllUsersModel{
  List<UserModel>? userList;
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  // "page": 2,
  // "per_page": 6,
  // "total": 12,
  // "total_pages": 2,

  AllUsersModel.fromJson(Map<String,dynamic>parsedJson)
  {
    page = parsedJson['page'];
    perPage = parsedJson['per_page'];
    total = parsedJson['total'];
    totalPages = parsedJson['total_pages'];
    var list = parsedJson['data'] as List;
    var _list = list.map((e) => UserModel.fromJsonFromUserList(e)).toList();
    List<UserModel> _userList = List<UserModel>.from(_list);
    userList = _userList;
    // userList = _list;
  }

}