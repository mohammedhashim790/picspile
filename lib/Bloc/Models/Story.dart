import 'package:uuid/v4.dart';

class Story{
  String id = const UuidV4().generate();
  String placeholder;
  String title;

  Story(this.placeholder, this.title);
}
