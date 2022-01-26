

class UserModel
{
  int? id;
  String? firstName;
  String? lastName;
  String? avatarUrl;

  UserModel.fromJson(Map<String,dynamic>parsedJson)
  {
    var data = parsedJson['data'];
    id = data['id'];
    firstName = data['first_name'];
    lastName  = data['last_name'];
    avatarUrl = data['avatar'];
  }

}