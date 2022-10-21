import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

crossButton() {
  GestureDetector(
    onTap: () => Get.back(),
    child: Container(
      width: 8.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.clear,
          color: Colors.grey,
          size: 15.sp,
        ),
      ),
    ),
  );
}
