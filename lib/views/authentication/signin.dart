import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/views/authentication/reset_password.dart';
import 'package:smartlicense/views/authentication/signup.dart';

import '../../controllers/loading.dart';
import '../../services/auth.dart';
import '../../utils/snackbar.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/custom_text.dart';
import '../../utils/widgets/loading.dart';
import '../../utils/widgets/text_field.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);
  final TextEditingController passController = TextEditingController();
  final TextEditingController email = TextEditingController();
  final loading = Get.find<LoadingController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Get.offAll(() => SignUp()),
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      CupertinoIcons.chevron_back,
                      size: 22.sp,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            title: Text(
              "Back",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 85.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      alignHeadingText("SignIn"),
                      SizedBox(
                        height: 3.h,
                      ),
                      alignBodyText("Welcome back to Smart License"),
                      SizedBox(
                        height: 2.h,
                      ),
                      alignBlueTextButton("Dont have an acount?\nGo to Sign Up",
                          () {
                        Get.offAll(() => SignUp());
                      }),
                      SizedBox(
                        height: 2.h,
                      ),
                      textField("E-Mail-Adresse*", email,
                          textInputType: TextInputType.emailAddress),
                      textField("Password", passController, obscureText: true),
                      Padding(
                          padding: EdgeInsets.only(left: 3.5.w, bottom: 2.h),
                          child: alignBlueTextButton("Forgot Password?", () {
                            Get.to(() => ResetPassword());
                          }, alignment: Alignment.centerLeft)),
                      Padding(
                          padding: EdgeInsets.only(left: 3.5.w),
                          child: alignBodyText(
                              "By clicking Register you agree to our",
                              boxAlignment: Alignment.center)),
                      FittedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              alignBlueTextButton("Privacy Policy", () {}),
                              alignBodyText(" and  "),
                              alignBlueTextButton(
                                  "Terms and Conditions", () {}),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 3.5.w),
                          child: alignBodyText(".",
                              boxAlignment: Alignment.centerLeft)),
                      Spacer(),
                      customButton("Anmelden", () {
                        if (email.text.isEmpty && passController.text.isEmpty) {
                          snackbar('Alert', "All fields are required");
                        } else if (!GetUtils.isEmail(email.text)) {
                          snackbar('Alert', "Email is not valid");
                        } else {
                          FocusScope.of(context).unfocus();
                          loading.isLoading.value = true;
                          signinWithEmail(email.text, passController.text);
                        }
                      }),
                      SizedBox(
                        height: 2.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        LoadingWidget()
      ],
    );
  }
}
