import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyColors {
  static const Color blue = Color(0xff0885AC);
  static const Color lightBlue = Color(0xff9CCEDE);
  static const Color blueText = Color(0xff055067);
  static const Color skyBlue = Color(0xff24CBCB);
  static const Color greyBlue = Color(0xffD6EEF0);
  static const Color lightestBlue = Color(0xffF0F9F9);
  static const Color darkBlue = Color(0xff055067);
  static const Color lightGrey = Color(0xffF5F5F5);
  static const Color categorizedCourseDarkBlue = Color(0xffCEE7EE);
  static const Color categorizedCourseLightBlue = Color(0xffE6F3F7);
}

class TextStyles {
  static TextStyle categoryTitle = TextStyle(
    fontSize: 18.sp,
    color: Colors.white.withOpacity(0.8),
    fontWeight: FontWeight.bold,
    // shadows: [
    //   Shadow(
    //       // bottomLeft
    //       offset: Offset(-1.5, -1.5),
    //       color: Colors.black.withOpacity(0.2)),
    //   Shadow(
    //       // bottomRight
    //       offset: Offset(1.5, -1.5),
    //       color: Colors.black.withOpacity(0.2)),
    //   Shadow(
    //       // topRight
    //       offset: Offset(1.5, 1.5),
    //       color: Colors.black.withOpacity(0.2)),
    //   Shadow(
    //       // topLeft
    //       offset: Offset(-1.5, 1.5),
    //       color: Colors.black.withOpacity(0.2)),
    // ]
  );
}
