import 'package:flutter/material.dart';
import 'package:picspile/Views/Explore/ExploreScreen.dart';

import 'package:picspile/Views/HomeScreen/HomeScreen.dart';
import 'package:picspile/Views/Profile/profile.dart';

class PageNavigationClass extends StatefulWidget {
  @override
  _PageNavigationClassState createState() => _PageNavigationClassState();
}

class _PageNavigationClassState extends State<PageNavigationClass> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = [
      //home screen
      const HomeScreen(),
      //explore screen
      const ExploreScreen(),
      //!add post screen - TBD
      const Text('Add post - TBD'),
      //!likes screen - TBD
      const Text('Likes - TBD'),
      //profilescreen
      const Profile(),
    ];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffEEFFD2),
            Color(0xffBCFE8A),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: PicsPileNavBar(
          items: [
            PicsPileNavBarItems(
              imageAsset: 'assets/navigationAssets/House_01.png',
              selectedIconColor: const Color.fromARGB(255, 207, 208, 207),
              unselectedIconColor: Colors.black,
              assetHeight: 25,
            ),
            PicsPileNavBarItems(
              imageAsset: 'assets/navigationAssets/Globe.png',
              selectedIconColor: Colors.green.shade900,
              unselectedIconColor: Colors.black,
              assetHeight: 25,
            ),
            PicsPileNavBarItems(
              imageAsset: 'assets/navigationAssets/Add_Plus_Circle.png',
              assetHeight: 45,
            ),
            PicsPileNavBarItems(
              imageAsset: 'assets/navigationAssets/heart.png',
              selectedIconColor: Colors.green.shade900,
              unselectedIconColor: Colors.black,
              assetHeight: 25,
            ),
            PicsPileNavBarItems(
              imageAsset: 'assets/navigationAssets/profile.png',
              assetHeight: 35,
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          bgColor: Colors.white,
        ),
      ),
    );
  }
}

class PicsPileNavBar extends StatefulWidget {
  final Color? bgColor;
  final List<PicsPileNavBarItems> items;
  final int currentIndex;
  final Function(int) onTap;
  const PicsPileNavBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
    this.bgColor,
  });

  @override
  PicsPileNavbarState createState() => PicsPileNavbarState();
}

class PicsPileNavbarState extends State<PicsPileNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(
          color: Colors.grey.shade800.withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items.map((items) {
          int index = widget.items.indexOf(items);
          bool isSelected = index == widget.currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => widget.onTap(index),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: isSelected
                    ? [
                        Image.asset(
                          items.imageAsset,
                          color: items.selectedIconColor,
                          fit: BoxFit.cover,
                          height: items.assetHeight,
                        ),
                      ]
                    : [
                        Image.asset(
                          items.imageAsset,
                          color: items.unselectedIconColor,
                          height: items.assetHeight,
                        ),
                      ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class PicsPileNavBarItems {
  final String imageAsset;
  final Color? selectedIconColor;
  final Color? unselectedIconColor;
  final double? assetHeight;

  PicsPileNavBarItems({
    required this.imageAsset,
    this.selectedIconColor,
    this.unselectedIconColor,
    this.assetHeight,
  });
}
