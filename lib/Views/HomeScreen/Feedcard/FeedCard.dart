import 'package:flutter/material.dart';
import 'package:picspile/Bloc/Models/Feed.dart';
import 'package:picspile/Views/HomeScreen/Feedcard/FeedContent.dart';
import 'package:picspile/Views/HomeScreen/Feedcard/FeedOptions.dart';
import 'package:picspile/Views/HomeScreen/Feedcard/FeedTop.dart';

class FeedCard extends StatefulWidget {
  Feed feed;
  FeedCard({super.key, required this.feed});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      constraints: const BoxConstraints(minHeight: 200.0),
      decoration: const BoxDecoration(
          color: Colors.white, // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Feedtop(feed: widget.feed),
            FeedContent(content: widget.feed.content.first),
            FeedOptions(feed: widget.feed)
          ],
        ),
      ),
    );
  }
}
