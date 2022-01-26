

class UserModel
{
  int? id;
  String? firstName;
  String? lastName;
  String? avatarUrl;
  String? email;

  UserModel.fromJsonFromUserList(Map<String,dynamic>parsedJson)
  {
    id = parsedJson['id'];
    firstName = parsedJson['first_name'];
    lastName  = parsedJson['last_name'];
    avatarUrl = parsedJson['avatar'];
    email = parsedJson['email'];
  }
  UserModel.fromJson(Map<String,dynamic>parsedJson)
  {
    var user = parsedJson['data'];
    id = user['id'];
    firstName = user['first_name'];
    lastName  = user['last_name'];
    avatarUrl = user['avatar'];
    email = user['email'];
  }
}