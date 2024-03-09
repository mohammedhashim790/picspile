import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  String image;
  bool addIcon;
  StoryItem({super.key,required this.image,this.addIcon = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CircleAvatar(
          radius: 32.0,
          backgroundColor: Colors.green,
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(image),
          ),
        ),
        Visibility(
          visible: addIcon,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
              boxShadow: [
                BoxShadow(color: Colors.white,spreadRadius: 3.0)
              ]
            ),
            child: const Icon(Icons.add)
          ),
        )
      ],
    );
  }
}
