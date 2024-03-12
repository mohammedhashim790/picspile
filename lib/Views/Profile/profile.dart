import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picspile/Views/Misc/constants.dart';
import 'package:picspile/Views/Misc/extensions.dart';
import 'package:picspile/Views/Profile/profile_cards.dart';
import 'package:picspile/Views/Profile/profile_grid.dart';
import 'package:picspile/Views/Settings/settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<Profile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              //Animated container based on isexpandable bool flag
              child: buildAnimatedContainer(),
            ),
            if (!_isExpanded) buildTabwithDivider(),
            Expanded(
              child: buildTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: context.kMainPaddingOnly().copyWith(
                left: 9,
                top: 20,
                bottom: 0,
                right: 10,
              ),
          child: ImageGridPage(),
        ),
        Padding(
          padding: context.kMainPaddingOnly(
            left: 10,
            top: 20,
            bottom: 0,
            right: 10,
          ),
          child: const ProfileCardsList(),
        ),
        Padding(
          padding: context.kMainPaddingOnly(
            left: 10,
            top: 20,
            bottom: 0,
            right: 10,
          ),
          child: const ProfileCardsList(),
        ),
      ],
    );
  }

  Widget buildTabwithDivider() {
    return Column(
      children: [
        sizeH(context, 10),
        buildTabBar(),
        Padding(
          padding: context.kMainPaddingSymmetric(horizontal: 12),
          child: Divider(
            color: Colors.black,
            thickness: 1.h,
            height: 1.h,
          ),
        ),
      ],
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
      labelColor: Colors.red,
      unselectedLabelColor: Colors.black,
      tabs: [
        Tab(
          child: Text(
            'Posts',
            textAlign: TextAlign.center,
            style: kMontserratTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Followers',
            style: kMontserratTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Following',
            style: kMontserratTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAnimatedContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: context.kMainPaddingSymmetric(horizontal: 12),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: _isExpanded
          ? context.screenHeight * 0.50
          : context.screenHeight * 0.20,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 20),
              color: Colors.black38,
              spreadRadius: 2,
              blurRadius: 20,
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    height: context.screenHeight * 0.035,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            color: Colors.black12,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'rajdeep.chatterjee',
                              style: kMontserratTextStyle(context)
                                  .copyWith(fontSize: 13),
                            ),
                            sizeW(context, 5),
                            Transform.rotate(
                              angle: 90 * (3.14 / 180),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12.h,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                const Spacer(),

                //settings page
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    context.createRoute(
                      const Settings(),
                    ),
                  ),
                  icon: const Icon(Icons.menu),
                )
              ],
            ),
            sizeH(context, 8),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: _isExpanded ? userDetailExpanded() : userDetail(),
            ),
          ],
        ),
      ),
    );
  }

  Widget userDetailExpanded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/navigationAssets/profile.png'),
              radius: 55.r,
            ),
            Positioned(
              top: 0,
              left: 90,
              right: 0,
              bottom: -90,
              child: SizedBox(
                height: 20.h,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),
                  child: Icon(
                    Icons.edit,
                    size: 10.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        sizeH(context, 10),
        Text(
          'Rajdeep Chatarjee',
          style: kMontserratTextStyle(context).copyWith(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        sizeH(context, 10),
        Text(
          'UI/UX Designer',
          style: kMontserratTextStyle(context).copyWith(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'rr4060@srmist.edu.in',
          style: kMontserratTextStyle(context).copyWith(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        sizeH(context, 20),
        Text(
          'https://dribbble.com/Rajdeep76',
          style: kMontserratTextStyle(context).copyWith(
            fontSize: 12.sp,
            color: Colors.blue,
            fontWeight: FontWeight.w400,
          ),
        ),
        sizeH(context, 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            feedDetailsItem(
              count: '23',
              label: 'Posts',
              titleHeight: 30.sp,
              subtitleHeight: 12.sp,
            ),
            feedDetailsItem(
              count: '43',
              label: 'Followers',
              titleHeight: 30.sp,
              subtitleHeight: 12.sp,
            ),
            feedDetailsItem(
              count: '97',
              label: 'Following',
              titleHeight: 30.sp,
              subtitleHeight: 12.sp,
            )
          ],
        )
      ],
    );
  }

  Widget userDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/navigationAssets/profile.png'),
              radius: 35.r,
            ),
            Positioned(
              top: 0,
              left: 45,
              right: 0,
              bottom: -45,
              child: SizedBox(
                height: 20.h,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      )),
                  child: Icon(
                    Icons.edit,
                    size: 10.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //username
            Row(
              children: [
                Text(
                  'Rajdeep Chatarjee',
                  style: kMontserratTextStyle(context).copyWith(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                sizeW(context, 5),
                const Icon(Icons.edit),
              ],
            ),
            sizeH(context, 5),
            //feed details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                feedDetailsItem(
                  count: '42',
                  label: 'Posts',
                  titleHeight: 20.sp,
                  subtitleHeight: 10.sp,
                ),
                sizeW(context, 15),
                feedDetailsItem(
                  count: '42',
                  label: 'Followers',
                  titleHeight: 20.sp,
                  subtitleHeight: 10.sp,
                ),
                sizeW(context, 15),
                feedDetailsItem(
                  count: '42',
                  label: 'Following',
                  titleHeight: 20.sp,
                  subtitleHeight: 10.sp,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget feedDetailsItem({
    required String count,
    required String label,
    required double titleHeight,
    required double subtitleHeight,
  }) {
    return Column(
      children: [
        Text(
          count,
          style: kMontserratTextStyle(context).copyWith(
            fontSize: titleHeight,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        sizeH(context, 2),
        Text(
          label,
          style: kMontserratTextStyle(context).copyWith(
            fontSize: subtitleHeight,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
