// import 'location.dart';
// import 'name.dart';
// import 'picture.dart';

class Account {
  String email;
  String password = '';
  String ffaId;
  String error;

  Account({this.email, this.ffaId, this.password});

  Account.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        ffaId = json["ffaId"];
  // location = Location.fromJson(json["location"]),
  // picture = Picture.fromJson(json["picture"]);

  Account.withError(String error) : error = error;
}
