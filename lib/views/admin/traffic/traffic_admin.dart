import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';
import 'package:smartlicense/views/approval%20pages/pending_license_payment_approvals.dart';
import '../../approval pages/Pending_field_test_payment_approvals.dart';
import '../../approval pages/form_approval.dart';
import '../../approval pages/pending_field_approvals.dart';
import '../../approval pages/pending_medical_payment_approvals.dart';
import '../../approval pages/pending_pickup_approvals.dart';

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
          customButton("Pending meidcal payments Approvals",
              () => Get.to(() => MeidcalPayment())),
          SizedBox(height: 1.h),
          customButton("Pending field test payment Approvals",
              () => Get.to(() => FieldTestPayment())),
          SizedBox(height: 1.h),
          customButton(
              "Pending Field Approvals", () => Get.to(() => FieldApprovals())),
          SizedBox(height: 1.h),
          customButton("Pending license payment Approvals",
              () => Get.to(() => LicensePayment())),
          SizedBox(height: 1.h),
          customButton("Pending Pickup Approvals",
              () => Get.to(() => PickupApprovals())),
          SizedBox(height: 1.h),
        ]),
      ),
    );
  }
}
