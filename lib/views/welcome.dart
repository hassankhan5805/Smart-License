import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';
import 'package:smartlicense/views/user/form_registration.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});
  final RxBool showHelp = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: "Welcome", hideBackButton: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.h),
          Obx(() => Column(
                children: [
                  InkWell(
                      onTap: () {
                        showHelp.value = !showHelp.value;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Show Help"),
                          Icon(showHelp.value
                              ? Icons.arrow_drop_down_circle_sharp
                              : Icons.arrow_drop_down_circle_outlined),
                        ],
                      )),
                  Visibility(visible: showHelp(), child: Text("""
1.Create your Account
2.Login Your Account
3.Apply For New License
4.Enter Your BioData
5.pay your Medical fee
6.Enter Your Transcation ID
7.Go for Physical Test.
8.Pay License card fee
9.Pick Up Your License card""")),
                ],
              )),
          SizedBox(height: 2.h),
          customButton("Apply for license renewel", () {}),
          SizedBox(height: 2.h),
          customButton(
              "Apply for new license", () => Get.to(() => FormRegistration())),
          SizedBox(height: 42.h),
        ],
      ),
    );
  }
}
