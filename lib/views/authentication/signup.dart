import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/views/authentication/signin.dart';
import '../../services/auth.dart';
import '../../utils/snackbar.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/custom_text.dart';
import '../../utils/widgets/loading.dart';
import '../../utils/widgets/text_field.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final TextEditingController passController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              width: double.infinity,
              // child: GestureDetector(
              //   // onTap: () => Get.offAll(() => WelcomeScreen()),
              //   child: Row(
              //     children: [
              //       SizedBox(
              //         width: 5.w,
              //       ),
              //       Icon(
              //         CupertinoIcons.chevron_back,
              //         size: 22.sp,
              //         color: Colors.black,
              //       ),
              //     ],
              //   ),
              // ),
            ),
            centerTitle: true,
            title: Text(
              "SignUp",
              style: TextStyle(color: Colors.black),
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
                      alignHeadingText("Welcome to Smart License"),
                      SizedBox(
                        height: 2.h,
                      ),
                      alignBodyText(
                          "Smart License will make the traditional license making system easy"),
                      SizedBox(
                        height: 2.h,
                      ),
                      alignBodyText("Already have an account?"),
                      alignBlueTextButton("Sign In", () {
                        Get.offAll(() => Signin());
                      }),
                      textField("Name*", name),
                      textField("E-Mail-Adresse*", email,
                          textInputType: TextInputType.emailAddress),
                      textField("Password", passController, obscureText: true),
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
                      customButton("Register", () {
                        if (name.text.isNotEmpty &&
                            email.text.isNotEmpty &&
                            passController.text.isEmpty) {
                          snackbar(
                            'Alert',
                            "All fields are required",
                          );
                        } else if (!GetUtils.isEmail(email.text)) {
                          snackbar(
                            'Alert',
                            "Email is not valid",
                          );
                        } else {
                          FocusScope.of(context).unfocus();
                          createAccount(
                              name.text, email.text, passController.text);
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
