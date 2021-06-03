import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const ROLE = 'role';

  String id;
  String name;
  String email;
  String role;

  UserModel({this.name, this.role, this.id, this.email});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.data()[NAME];
    role = snapshot.data()[ROLE];
    email = snapshot.data()[EMAIL];
    id = snapshot.data()[ID];
  }
}
