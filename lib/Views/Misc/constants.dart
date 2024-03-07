import 'package:flutter/material.dart';
import 'package:picspile/Views/Misc/extensions.dart';

const kBackgroundColor = Colors.black;
const kNavigationLabelColor = Colors.white;
const kWhiteTextColor = Color(0xffFFFFFF);
const kB8B8TextColor = Color(0xffB8B8B8);
Color kB8B8TextColorwithOpacity = const Color(0xffBABABA).withOpacity(0.8);
Color kgrey100TextColorwithOpacity = Colors.grey.shade500.withOpacity(0.5);

// Font Size
double kMontserratFontsize(BuildContext context) => context.sp(14);

// Font styles
TextStyle kMontserratTextStyle(BuildContext context) => TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMontserratFontsize(context),
      fontWeight: FontWeight.w400,
    );

// SizedBox heights
SizedBox sizeH(BuildContext context, double height) =>
    SizedBox(height: context.h(height));

// SizedBox widths
SizedBox sizeW(BuildContext context, double width) =>
    SizedBox(width: context.w(width));
