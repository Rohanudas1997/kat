// ignore_for_file: public_member_api_docs, sort_constructors_first
class Users {
  String name;
  String samId;
  String email;

  String get getName => this.name;

  set setName(String name) => this.name = name;

  get getSamId => this.samId;

  set setSamId(samId) => this.samId = samId;

  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  Users({
    required this.name,
    required this.samId,
    required this.email,
  });
}
