class UserModel {
  int id;
  String name;
  String email;
  String jwt;
  int isLoged;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.jwt,
    this.isLoged,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'email': email,
      'jwt': jwt,
      'isLoged': isLoged,
    };
    return map;
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      jwt: map['jwt'],
      isLoged: map['isLoged'],
    );
  }

}
