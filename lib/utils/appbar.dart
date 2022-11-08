import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

AppBar appBar({required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Container(
      width: double.infinity,
      height: 5.h,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            Icon(
              CupertinoIcons.chevron_back,
              size: 22.sp,
              color: Colors.black,
            ),
          ],
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
  );
}
