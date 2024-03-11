import 'package:picspile/Bloc/Models/User.dart';
import 'package:picspile/Services/UserService/IUserService.dart';

final List<User> users = [
  User(
      name: "Rajdeep Chatterjee",
      designation: "UI/UX Designer",
      emailAddress: "rr4060@srmist.edu",
      profile: "assets/profile/me.png",
      username: "rajdeep.chatterjee",
      bio: "https://dribble.com"),
  User(
      name: "Tom Cruise",
      designation: "Actor",
      username: "tom_cruise",
      profile: "assets/profile/tom_cruise.jpg",
      emailAddress: "tom.cruise@xyz.com"),
  User(
      name: "Cherry+Network",
      username: "cherry.network",
      emailAddress: "cherry.network@xyz.com",
      profile: "assets/profile/cherry_network.png"),
  User(
      name: "Techverse",
      username: "techverse",
      emailAddress: "TechVerse@xyz.com",
      profile: "assets/profile/techverse.png"),
  User(
      name: "Endeavour",
      username: "endeavour",
      emailAddress: "TechVerse@xyz.com",
      profile: "assets/profile/creative.png"),
  User(
      name: "App Archives",
      username: "app.archives",
      emailAddress: "app.archives@xyz.com",
      profile: "assets/profile/app_archive.png"),
];

class UserService implements IUserService {
  @override
  Future<User> createItem({required User item}) {
    users.add(item);
    return Future.value(item);
  }

  @override
  Future<User> getItem({required String id}) {
    return Future.value(users.firstWhere((element) => element.id == id));
  }

  @override
  Future<List<User>> listAll() {
    return Future.value(users);
  }
}
