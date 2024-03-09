import 'dart:async';

import 'package:picspile/Bloc/Models/User.dart';
import 'package:uuid/v4.dart';

class Feed {
  String id = const UuidV4().generate();
  String profile;
  String title;
  String subtitle;

  int _likes;
  int _comments;

  bool liked = false;

  List<String> content = [];

  final StreamController<Feed> _controller = StreamController();

  Stream<Feed> get controller => _controller.stream;

  Feed(
      {required this.profile,
      required this.title,
      required this.subtitle,
      required int likes,
      required int comments,
      required this.content}) : _comments = comments, _likes = likes;


  String get likes => "$_likes Likes";

  doubleTap() {
    if (!liked) {
      _likes++;
    }
    liked = true;
  }

  unTap() {
    if (liked) {
      _likes--;
    }
    liked = false;
  }

  String get comments => "View all $_comments comments";
}
