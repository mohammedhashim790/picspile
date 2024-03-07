import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//screen heightwidth
extension ScreenUtilExtension on BuildContext {
  double get screenHeight => ScreenUtil().screenHeight;

  double get screenWidth => ScreenUtil().screenWidth;

  double get statusBarHeight => ScreenUtil().statusBarHeight;

  double get bottomBarHeight => ScreenUtil().bottomBarHeight;

  double h(double designHeight) => ScreenUtil().setHeight(designHeight);

  double w(double designWidth) => ScreenUtil().setWidth(designWidth);

  double sp(double designFontSize) => ScreenUtil().setSp(designFontSize);
}

//padding
extension PaddingExtension on BuildContext {
  EdgeInsets kMainPaddingOnly({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    top = top != null ? ScreenUtil().setHeight(top).toDouble() : 0.0;
    bottom = bottom != null ? ScreenUtil().setHeight(bottom).toDouble() : 0.0;
    left = left != null ? ScreenUtil().setWidth(left).toDouble() : 0.0;
    right = right != null ? ScreenUtil().setWidth(right).toDouble() : 0.0;

    return EdgeInsets.only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }

  EdgeInsets kMainPaddingAll(double value) {
    final scaledValue = ScreenUtil().setWidth(value).toDouble();
    return EdgeInsets.all(scaledValue);
  }

  EdgeInsets kMainPaddingSymmetric({double? vertical, double? horizontal}) {
    final scaledVertical =
        vertical != null ? ScreenUtil().setHeight(vertical).toDouble() : 0.0;
    final scaledHorizontal =
        horizontal != null ? ScreenUtil().setWidth(horizontal).toDouble() : 0.0;
    return EdgeInsets.symmetric(
      vertical: scaledVertical,
      horizontal: scaledHorizontal,
    );
  }
}

extension ContextExtensions on BuildContext {
  Route createRoute(Widget goToPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, _) => goToPage,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, _, child) {
        var tween = Tween(begin: 0.0, end: 1.0).chain(
          CurveTween(curve: Curves.easeIn),
        );
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
