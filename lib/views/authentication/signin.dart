import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/views/authentication/reset_password.dart';
import 'package:smartlicense/views/authentication/signup.dart';
import '../../services/authentication.dart';
import '../../utils/snackbar.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/custom_text.dart';
import '../../utils/widgets/loading.dart';
import '../../utils/widgets/text_field.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);
  final TextEditingController passController = TextEditingController();
  final TextEditingController email = TextEditingController();
  final RxBool showHelp = false.obs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(
              context: context,
              title: "Sign in",
              showLogout: false,
              hideBackButton: true),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 85.h,
                  child: ListView(
                    children: [
                      alignBodyText("Welcome back to Easy Driving License"),
                      Image.asset("assets/images/logo2.png", height: 20.h),
                      Obx(() => Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Show Help"),
                                    IconButton(
                                        onPressed: () {
                                          showHelp.value = !showHelp.value;
                                        },
                                        icon: Icon(showHelp.value
                                            ? Icons.arrow_drop_down_circle_sharp
                                            : Icons
                                                .arrow_drop_down_circle_outlined))
                                  ]),
                              Visibility(visible: showHelp(), child: Text("""
1.Enter Email Address
2.Enter your password 
3.Click on Continue
4.If you don't have an account, please press the "Don't have an accunt" below""")),
                            ],
                          )),
                      SizedBox(height: 2.h),
                      alignBlueTextButton(
                          "Don't have an acount?\nGo to Sign Up", () {
                        Get.to(() => SignUp());
                      }),
                      SizedBox(
                        height: 2.h,
                      ),
                      textField("E-Mail-Adresse", email,
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
                      SizedBox(height: 2.h),
                      customButton("Continue", () {
                        if (formValidation()) {
                          FocusScope.of(context).unfocus();
                          Authentication()
                              .signinWithEmail(email.text, passController.text);
                        }
                      }),
                      SizedBox(height: 2.h)
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

  bool formValidation() {
    if (email.text.isEmpty && passController.text.isEmpty) {
      alertSnackbar("All fields are required");
      return false;
    } else if (!GetUtils.isEmail(email.text)) {
      alertSnackbar("Email is not valid");
      return false;
    } else {
      return true;
    }
  }
}
