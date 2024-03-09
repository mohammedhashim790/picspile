import 'package:picspile/Bloc/Models/Feed.dart';
import 'package:picspile/Bloc/Models/User.dart';
import 'package:uuid/v4.dart';

class UserProfile {
  String id = const UuidV4().generate();
  User user;
  List<Feed> posts;
  List<User> followers;
  List<User> following;

  UserProfile(
      {required this.user,
      required this.posts,
      required this.followers,
      required this.following});
}
