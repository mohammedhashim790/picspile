import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:picspile/Services/FeedService/FeedService.dart';
import 'package:picspile/Views/Explore/ExploreScreen.dart';
import 'package:picspile/Views/HomeScreen/Feedcard/FeedCard.dart';
import 'package:picspile/Views/HomeScreen/Story/StoryList.dart';
import 'package:picspile/Views/Misc/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.circle_outlined),
        actions: [Icon(PhosphorIcons.messengerLogo())],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const StoryList(),
              ...feeds.map((item) => FeedCard(feed: item)).toList()
            ],
          ),
        ),
      ),
    );
  }
}
