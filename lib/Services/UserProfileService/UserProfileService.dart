import 'package:picspile/Bloc/Models/Feed.dart';
import 'package:picspile/Bloc/Models/UserProfile.dart';
import 'package:picspile/Services/FeedService/FeedService.dart';
import 'package:picspile/Services/UserProfileService/IUserProfileService.dart';
import 'package:picspile/Services/UserService/UserService.dart';

final UserProfile userProfile = UserProfile(
  user: users.first,
  posts: [
    feeds.first
  ],
  followers: users.where((user) => user.id!=users.first.id).toList(),
  following: users.where((user) => user.id!=users.first.id).toList()
);


class UserProfileService implements IUserProfileService{
  @override
  Future<UserProfile> createItem({required UserProfile item}) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<UserProfile> getItem({String? id}) {
    return Future.value(userProfile);
  }

  @override
  Future<List<UserProfile>> listAll() {
    // TODO: implement listAll
    throw UnimplementedError();
  }

}