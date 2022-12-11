import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';
import '../../approval pages/form_approval.dart';

class TrafficAdmin extends StatelessWidget {
  const TrafficAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: "Traffic Admin"),
      body: Center(
        child: Column(children: [
          SizedBox(height: 4.h),
          customButton(
              "Pending Form Approvals", () => Get.to(() => FormApproval())),
          SizedBox(height: 1.h),
          customButton("Pending Field Approvals", () {}),
          SizedBox(height: 1.h),
          customButton("Pending Pickup Approvals", () {}),
          SizedBox(height: 1.h),
          customButton("Pending meidcal payments Approvals", () {}),
          SizedBox(height: 1.h),
          customButton("Pending field test payment Approvals", () {}),
          SizedBox(height: 1.h),
          customButton("Pending license payment Approvals", () {}),
        ]),
      ),
    );
  }
}
