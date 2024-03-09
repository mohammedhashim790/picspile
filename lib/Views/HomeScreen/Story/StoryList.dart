import 'package:flutter/material.dart';
import 'package:picspile/Views/HomeScreen/Story/StoryItem.dart';

class StoryList extends StatefulWidget {
  const StoryList({super.key});

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {

  final List<String> _stories = [
    "assets/profile/me.png",
    "assets/profile/creative.png",
    "assets/profile/cherry_network.png",
    "assets/profile/app_archive.png",
    "assets/profile/techverse.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _stories.indexed.map((item)=>StoryItem(image: item.$2,addIcon: item.$1 == 0)).toList(),
      ),
    );
  }
}
