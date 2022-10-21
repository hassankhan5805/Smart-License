import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

WarningDialog(
    {required BuildContext context,
    required String title,
    required Function onYes}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          height: 35.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 2,
              ),
              Center(
                child: Text(
                  "Warning",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Text("$title", textAlign: TextAlign.center),
              SizedBox(
                height: 2,
              ),
              Container(
                width: double.infinity,
                height: 0.1,
                decoration: BoxDecoration(color: Colors.grey.shade400),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "No, go back!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
              Container(
                width: double.infinity,
                height: 0.1,
                decoration: BoxDecoration(color: Colors.grey.shade400),
              ),
              TextButton(
                onPressed: () {
                  onYes();
                  Get.back();
                },
                child: Text(
                  "Yes, I'm sure ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
