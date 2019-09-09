part of demolib;

class User{

  int id;
  String username;
  bool active;

  User(this.id, this.username, this.active);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        active = json['active'];

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'username' : username,
        'active' : active,
      };

}