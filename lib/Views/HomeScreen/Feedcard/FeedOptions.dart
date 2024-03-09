import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:picspile/Bloc/Models/Feed.dart';
import 'package:picspile/Views/Widgets/Heart/Heart.dart';

class FeedOptions extends StatefulWidget {
  Feed feed;
  FeedOptions({super.key, required this.feed});

  @override
  State<FeedOptions> createState() => _FeedOptionsState();
}

class _FeedOptionsState extends State<FeedOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      PhosphorIcons.heart(PhosphorIconsStyle.fill),
                      size: 20,
                      fill: 0.9,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      PhosphorIcons.chatCircle(),
                      size: 19,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      PhosphorIcons.paperPlaneTilt(),
                      size: 17,
                    ),
                  )
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.attach_file,size: 17,))
          ],
        ),

        Text(widget.feed.likes,style: const TextStyle(
            fontWeight: FontWeight.w600,
          fontSize: 10
        )),
        Text(widget.feed.comments,style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 8,
          letterSpacing: 0.65
        )),
      ],
    );
  }
}
