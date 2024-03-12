import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:picspile/Services/FeedService/FeedService.dart';
import 'package:picspile/Views/Explore/ExploreScreen.dart';
import 'package:picspile/Views/HomeScreen/Feedcard/FeedCard.dart';
import 'package:picspile/Views/HomeScreen/Story/StoryList.dart';
import 'package:picspile/Views/SignIn/SignIn.dart';
import 'package:picspile/Views/SignUp/ChooseUsername.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const Icon(Icons.circle_outlined),
        actions: [
          Icon(PhosphorIcons.messengerLogo())
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const StoryList(),
                ...feeds.map((item)=> FeedCard(feed: item)).toList()
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ExploreScreen()));
        },
      ),
    );
  }
}
