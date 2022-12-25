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
              // Image.asset("assets/images/"),
              Row(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 85.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 6.h,
                      ),
                      alignBodyText("Welcome back to Easy Driving License"),
                      SizedBox(
                        height: 2.h,
                      ),
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
                      Spacer(),
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
