import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picspile/Views/Misc/constants.dart';
import 'package:picspile/Views/Misc/extensions.dart';
import 'package:picspile/Views/SignIn/SignIn.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // List of items and their respective icons
  final List<Map<String, dynamic>> items = [
    {
      'icon': 'assets/profile/follow_find.png',
      'title': 'Follow and invite friends',
    },
    {
      'icon': 'assets/profile/notify.png',
      'title': 'Notifications',
    },
    {
      'icon': 'assets/profile/Lock.png',
      'title': 'Privacy',
    },
    {
      'icon': 'assets/profile/Chield_light.png',
      'title': 'Security',
    },
    {
      'icon': 'assets/profile/ads.png',
      'title': 'Ads',
    },
    {
      'icon': 'assets/profile/accounts.png',
      'title': 'Accounts',
    },
    {
      'icon': 'assets/profile/help.png',
      'title': 'Help',
    },
    {
      'icon': 'assets/profile/about.png',
      'title': 'About',
    },
    {
      'icon': 'assets/profile/theme.png',
      'title': 'Theme',
    },
  ];
  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Settings',
            style: kMontserratTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //divider
            Padding(
              padding: context.kMainPaddingSymmetric(horizontal: 12),
              child: Divider(
                color: Colors.black,
                thickness: 1.h,
                height: 1.h,
              ),
            ),

            sizeH(context, 10),

            //settings bar
            Padding(
              padding: context.kMainPaddingSymmetric(horizontal: 12),
              child: Container(
                padding: context.kMainPaddingSymmetric(horizontal: 12),
                height: context.screenHeight * 0.05,
                width: context.screenWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Settings',
                      style: kMontserratTextStyle(context).copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
              ),
            ),

            //settings content
            Expanded(
              flex: 4,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding:
                        context.kMainPaddingAll(16).copyWith(bottom: 0, top: 2),
                    height: 0.07.sh,
                    width: context.screenWidth,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              items[index]['icon'],
                              height: 15.h,
                            ),
                            sizeW(context, 10),
                            Text(
                              items[index]['title'],
                              style: kMontserratTextStyle(context).copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            sizeH(context, 5),
            Expanded(
              flex: 1,
              child: Padding(
                padding: context.kMainPaddingSymmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Logins',
                      style: kMontserratTextStyle(context).copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    sizeH(context, 12),
                    Text(
                      'Add or switch accounts',
                      style: kMontserratTextStyle(context).copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    sizeH(context, 12),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        context.createRoute(
                          const SignInPage(),
                        ),
                      ),
                      child: Text(
                        'Logout Rajdeep.chatterjee',
                        style: kMontserratTextStyle(context).copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
