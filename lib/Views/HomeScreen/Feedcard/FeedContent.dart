import 'package:flutter/material.dart';

class FeedContent extends StatelessWidget {

  final String content;

  FeedContent({super.key,required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.black,
        image: DecorationImage(image: AssetImage(content),fit: BoxFit.fitHeight)
      ),
    );
  }
}
