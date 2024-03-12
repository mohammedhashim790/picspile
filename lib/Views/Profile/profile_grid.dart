import 'package:flutter/material.dart';

import 'package:picspile/Views/Misc/extensions.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ImageGridPage extends StatelessWidget {
  final List<String> imageList = [
    'assets/profile/post_1.png',
    'assets/profile/post_1.png',
    'assets/profile/post_2.png',
    'assets/profile/post_3.png',
    'assets/profile/post_4.png',
    'assets/profile/post_4.png',
    'assets/profile/post_4.png',
    'assets/profile/post_4.png',
  ];

  ImageGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: context.kMainPaddingAll(12),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: imageList.length,
          itemBuilder: (BuildContext context, int index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageList[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 3.5 : 2),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 10.0,
        ),
      ),
    );
  }
}
