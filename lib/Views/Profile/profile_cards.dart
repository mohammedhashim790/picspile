import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picspile/Views/Misc/constants.dart';
import 'package:picspile/Views/Misc/extensions.dart';

class ProfileCardData {
  final String id;
  final String title;
  final String subTitle;

  ProfileCardData(
      {required this.id, required this.title, required this.subTitle});
}

class ProfileCardsList extends StatefulWidget {
  const ProfileCardsList({Key? key});

  @override
  State<ProfileCardsList> createState() => _ProfileCardsListState();
}

class _ProfileCardsListState extends State<ProfileCardsList> {
  List<ProfileCardData> cards = [
    ProfileCardData(
      id: '1',
      title: 'Cherry+ Network',
      subTitle: 'Friends since its creation',
    ),
    ProfileCardData(
      id: '2',
      title: 'TechVerse',
      subTitle: 'Friends since 12 January 2022',
    ),
    ProfileCardData(
      id: '3',
      title: 'Endeavour',
      subTitle: 'Friends since 3 January 2021',
    ),
    ProfileCardData(
      id: '4',
      title: 'TechVApp Archiveserse',
      subTitle: 'Friends since 20 June 2021',
    ),
  ];

  @override
  void initState() {
    shuffleCards();
    super.initState();
  }

  void shuffleCards() {
    setState(() {
      cards.shuffle(Random.secure());
    });
  }

  void confirmRemoval(ProfileCardData cardData, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove ${cardData.title}?'),
          content: const Text('Are you sure you want to remove this card?'),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style:
                    kMontserratTextStyle(context).copyWith(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Remove',
                style:
                    kMontserratTextStyle(context).copyWith(color: Colors.black),
              ),
              onPressed: () {
                setState(
                    () => cards.removeWhere((card) => card.id == cardData.id));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return ProfileCard(
            key: ValueKey(cards[index].id),
            data: cards[index],
            onRemove: () => confirmRemoval(cards[index], context),
          );
        },
      ),
    );
  }

  // void removeCard(String id) {
  //   setState(() {
  //     cards.removeWhere((card) => card.id == id);
  //   });
  // }
}

class ProfileCard extends StatelessWidget {
  final ProfileCardData data;
  final VoidCallback onRemove;
  const ProfileCard({super.key, required this.data, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.09,
      margin: context.kMainPaddingOnly(bottom: 10),
      width: context.screenWidth,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black38,
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
        padding: context.kMainPaddingAll(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.grey,
            ),
            sizeW(context, 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.title,
                  style: kMontserratTextStyle(context).copyWith(
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  data.subTitle,
                  style: kMontserratTextStyle(context).copyWith(
                    color: Colors.black,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: onRemove,
              child: SizedBox(
                width: context.screenWidth * 0.26,
                height: context.screenHeight * 0.04,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff26B124),
                        Color(0xff106B10),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: context.kMainPaddingSymmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_remove_alt_1_rounded,
                          color: Colors.white,
                          size: 14.h,
                        ),
                        const Spacer(),
                        Text(
                          'Remove',
                          style: kMontserratTextStyle(context).copyWith(
                            color: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
