import 'package:picspile/Bloc/Models/Feed.dart';
import 'package:picspile/Services/FeedService/IFeedService.dart';
import 'package:picspile/Services/UserService/UserService.dart';


final List<Feed> feeds = [
  Feed(profile: users.first.profile,
      title: users.first.name,
      subtitle: "3h, Hippocrates Audiotorium",
      likes: 400,
      comments: 112,
      content: [
        "assets/feed/app_archive.png",
        "assets/feed/app_archive.png",
        "assets/feed/app_archive.png",
      ]
  ),
  Feed(profile: users[1].profile,
      title: users[1].name,
      subtitle: "13h, Chennai, India",
      likes: 400,
      comments: 112,
      content: [
        "assets/feed/UB.png"
      ]
  ),
];


class FeedService implements IFeedService {
  @override
  Future<Feed> createItem({required Feed item}) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<Feed> getItem({required String id}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<Feed>> listAll() {
    // TODO: implement listAll
    throw UnimplementedError();
  }

}
