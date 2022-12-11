import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/controllers/user_controller.dart';
import 'package:smartlicense/model/user.dart';
import 'package:smartlicense/services/reception.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/snackbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';
import 'package:smartlicense/utils/widgets/text_field.dart';
import 'package:smartlicense/views/user/form.dart';
import '../../constants/strings.dart';
import '../../utils/widgets/loading.dart';

class MeidcalPayment extends StatelessWidget {
  const MeidcalPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context: context, title: "Meidcal payment"),
        body: userCntr.allUsers != null
            ? SizedBox(
                height: 80.h,
                child: Obx(() {
                  List<UserModel> filteredList = userCntr.allUsers!
                      .where(
                          (p0) => p0.userType == AllStrings.medicalPaymentType)
                      .toList();
                  return ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: UserCardForAdmin(user: filteredList[index]),
                        );
                      });
                }),
              )
            : LoadingWidget());
  }
}

class UserCardForAdmin extends StatelessWidget {
  final UserModel user;
  const UserCardForAdmin({required this.user});
  @override
  Widget build(BuildContext context) {
    final white = TextStyle(color: Colors.white, fontSize: 12.sp);
    final heading = TextStyle(
        color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold);
    return InkWell(
      onTap: () => Get.to(() => UserCardForAdminExtension(user: user)),
      child: Container(
        height: 17.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 59, 88, 97),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(12.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${user.userType}", style: heading),
            Row(
              children: [
                Text("Name:", style: white),
                Spacer(),
                Text("${user.name}", style: white)
              ],
            ),
            Row(
              children: [
                Text("Email:", style: white),
                Spacer(),
                Text("${user.email}", style: white)
              ],
            ),
            Row(
              children: [
                Text("CNIC:", style: white),
                Spacer(),
                Text("${user.cnic}", style: white)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserCardForAdminExtension extends StatelessWidget {
  UserCardForAdminExtension({super.key, required this.user});
  final UserModel user;
  final TextEditingController declineReason = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context: context, title: "User Form Detailes", showLogout: false),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            textField("Transaction ID (Medical Payment)",
                TextEditingController(text: user.medicalPaymentTxID),
                readOnly: true),
            SizedBox(height: 1.h),
            customButton("Accept", () async {
              await Reception().updateMedicalPaymentRelevanceForUserAdmin(
                  user: user, accept: true, declineReason: "");
              snackbar("Submitted", "Approval submitted!");
            }),
            SizedBox(height: 1.h),
            textField("Payment Decline Reason", declineReason),
            SizedBox(height: 2.h),
            customButton("Decline", () async {
              if (declineReason.text.length > 10) {
                await Reception().updateMedicalPaymentRelevanceForUserAdmin(
                    user: user,
                    accept: false,
                    declineReason: declineReason.text);

                snackbar("Submitted", "Decline submitted!");
              } else {
                alertSnackbar(
                    "Decline Reason must be more than 10 charachters");
              }
            }, bgColor: Colors.red),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
