import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<String> assets = [
    "assets/explore/group.png",
    "assets/explore/group_1.png",
    "assets/explore/group_2.png",
    "assets/explore/group_3.png",
    "assets/explore/group_4.png",
    "assets/explore/group_5.png",
    "assets/explore/group_6.png",
    "assets/explore/group_7.png",
    "assets/explore/group_8.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(
              hintText: "Search",
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(36.0)
              ),
              suffixIcon: const Icon(Icons.search)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 300.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              opacity: 0.7,
                              image: AssetImage("assets/explore/video.png"))),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.red,
                        size: 62.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    padding: const EdgeInsets.all(8.0),
                    // padding around the grid
                    itemCount: assets.length,
                    // total number of items
                    itemBuilder: (context, index) {
                      return assetContainer(assetImage: assets[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget assetContainer({required String assetImage}) {
    return Container(
      height: 150.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight, image: AssetImage(assetImage))),
    );
  }
}
