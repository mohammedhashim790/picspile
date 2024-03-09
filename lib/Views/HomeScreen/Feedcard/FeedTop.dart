import 'package:flutter/material.dart';
import 'package:picspile/Bloc/Models/Feed.dart';

class Feedtop extends StatelessWidget {
  Feed feed;
  Feedtop({super.key,required this.feed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.green,
          child: CircleAvatar(
            radius: 23,
            backgroundImage: AssetImage(feed.profile),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(feed.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(feed.subtitle,
                    style: const TextStyle(fontSize: 10))
              ],
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(
          Icons.more_vert_rounded,
          size: 16,
        ))
      ],
    );
  }
}
