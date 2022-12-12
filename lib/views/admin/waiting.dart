import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/constants/strings.dart';
import 'package:smartlicense/controllers/admin_controller.dart';
import 'package:smartlicense/controllers/loading.dart';
import 'package:smartlicense/controllers/user_controller.dart';
import 'package:smartlicense/services/reception.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/snackbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';
import 'package:smartlicense/utils/widgets/loading.dart';
import 'package:smartlicense/utils/widgets/text_field.dart';

import '../../model/user.dart';

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar(context: context, title: "Waiting room", hideBackButton: true),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 2.h),
            customButton("Refresh Status", () {
              Reception().userReception();
              snackbar("Refreshed", "Status Refreshed!");
            }),
            SizedBox(height: 2.h),
            Center(
                child: adminCntr.admin != null
                    ? Obx(() {
                        return DynamicWidgets(userCntr.user.value);
                      })
                    : LoadingWidget()),
            Spacer(),
            Text("If you find any issue contact us at saadikhan9598@gmail.com",
                textAlign: TextAlign.center),
            SizedBox(height: 3.h)
          ],
        ),
      ),
    );
  }
}

class DynamicWidgets extends StatelessWidget {
  DynamicWidgets(this.user);

  final UserModel user;
  final textCntr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return user.userType == AllStrings.medicalPaymentType
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${user.medicalPaymentStatus}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red)),
              Text(
                  "Plese submit RS 100 into the account # 234824982347823 Easypaisa\nProvide the Transaction ID below",
                  textAlign: TextAlign.center),
              textField("Transaction ID", textCntr),
              customButton("Submit", () async {
                if (textCntr.text.isEmpty) {
                  alertSnackbar("Please provide Transaction ID");
                } else {
                  loading(true);
                  await Reception().updateMedicalPaymentRelevanceForUser(
                      user: user, txid: textCntr.text);
                  Reception().userReception();
                  loading(false);
                  snackbar("Submitted Successfully!",
                      "Please wait for admin response");
                }
              })
            ],
          )
        : user.userType == AllStrings.pickupPaymentType
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${user.licensePaymentStatus}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red)),
                  Text(
                      "Plese submit RS 100 into the account # 234824982347823 Easypaisa\nProvide the Transaction ID below",
                      textAlign: TextAlign.center),
                  textField("Transaction ID", textCntr),
                  customButton("Submit", () async {
                    if (textCntr.text.isEmpty) {
                      alertSnackbar("Please provide Transaction ID");
                    } else {
                      loading(true);
                      await Reception().updateMedicalPaymentRelevanceForUser(
                          user: user, txid: textCntr.text);
                      Reception().userReception();
                      loading(false);
                      snackbar("Submitted Successfully!",
                          "Please wait for admin response");
                    }
                  })
                ],
              )
            : user.userType == AllStrings.fieldPaymentType
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${user.fieldTestPaymentStatus}",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red)),
                      Text(
                          "Plese submit RS 100 into the account # 234824982347823 Easypaisa\nProvide the Transaction ID below",
                          textAlign: TextAlign.center),
                      textField("Transaction ID", textCntr),
                      customButton("Submit", () async {
                        if (textCntr.text.isEmpty) {
                          alertSnackbar("Please provide Transaction ID");
                        } else {
                          loading(true);
                          await Reception()
                              .updateMedicalPaymentRelevanceForUser(
                                  user: user, txid: textCntr.text);
                          Reception().userReception();
                          loading(false);
                          snackbar("Submitted Successfully!",
                              "Please wait for admin response");
                        }
                      })
                    ],
                  )
                : user.userType == AllStrings.medicalType
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${user.medicalComments}",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red)),
                          Text(
                              "Go to traffic medical center near xyz for your medical checkup\n Provide your Email ID to the doctor \nDoctor will update your result in the app",
                              textAlign: TextAlign.center),
                        ],
                      )
                    : user.userType == AllStrings.regWaitingType
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${user.formComments}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red)),
                              Text(
                                  "You are waiting here for Traffic Admin to review your registration form",
                                  textAlign: TextAlign.center),
                            ],
                          )
                        : user.userType == AllStrings.fieldType
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${user.drivingTestComments}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red)),
                                  Text(
                                      "Go to traffic driving test center near xyz for your driving test\n Provide your Email ID to the monitor on duty \He will update your result in the app",
                                      textAlign: TextAlign.center),
                                ],
                              )
                            : user.userType == AllStrings.pickupType
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${user.licensePickupDate} ${user.licensePickupDate}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.red)),
                                      Text(
                                          "Your application is at final stage\n Please wait admin will update license pickup location and time",
                                          textAlign: TextAlign.center),
                                    ],
                                  )
                                : user.userType == AllStrings.pendingAdminType
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Please wait for super admin to approve your request",
                                              textAlign: TextAlign.center),
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("${user.userType}",
                                              textAlign: TextAlign.center,
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          Text("Please wait!",
                                              textAlign: TextAlign.center),
                                        ],
                                      );
  }
}