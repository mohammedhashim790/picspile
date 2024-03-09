import 'package:uuid/v4.dart';

class User {
  String id = const UuidV4().generate();
  String name;
  String? designation;
  String emailAddress;
  String? bio;
  String? password;
  String profile;

  User(
      {required this.name,
      required this.profile,
      required this.emailAddress,
      this.bio,
      this.designation
      });
}
