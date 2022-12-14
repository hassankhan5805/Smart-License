import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/views/authentication/signin.dart';
import '../../services/authentication.dart';
import '../../utils/appbar.dart';
import '../../utils/snackbar.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/custom_text.dart';
import '../../utils/widgets/dropdown_tile.dart';
import '../../utils/widgets/loading.dart';
import '../../utils/widgets/text_field.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final TextEditingController passController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController designation = TextEditingController();
  final RxBool isAdmin = false.obs;
  final RxBool showHelp = false.obs;
  final RxString adminType = 'Traffic Admin'.obs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar:
              appBar(context: context, title: "Register", showLogout: false),
          body: Padding(
            padding: EdgeInsets.all(8.sp),
            child: ListView(
              children: [
                alignHeadingText("Welcome to Easy Driving License"),
                SizedBox(height: 2.h),
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
                                      : Icons.arrow_drop_down_circle_outlined))
                            ]),
                        Visibility(visible: showHelp(), child: Text("""
1.	Enter your Name
2.	Enter Email Address
3.	Create your strong password
4.	Click Register
5.	Go to Email Application and in a spam folder a new email can  be show open email and then click on link given in email 
6.	Again go to Easy Driving License Application and click On Refresh button 
7.	If Email not found the Click on Send again 
8.	Now  your account is created.""")),
                      ],
                    )),
                Image.asset("assets/images/logo2.png", height: 20.h),
                SizedBox(height: 2.h),
                alignBodyText("Already have an account?"),
                alignBlueTextButton("Sign In", () {
                  Get.to(() => Signin());
                }),
                textField("Name", name),
                textField("E-Mail-Adresse", email,
                    textInputType: TextInputType.emailAddress),
                textField("Password", passController, obscureText: true),
                Obx(
                  () => checkBoxTile(
                      text: "As Admin",
                      value: isAdmin.value,
                      onChange: (v) {
                        isAdmin.value = v;
                      }),
                ),
                Obx(() => Visibility(
                      visible: isAdmin.value,
                      child: Column(
                        children: [
                          textField("Designation", designation),
                          dropDownTile(value: adminType, list: [
                            'Traffic Admin',
                            'Super Admin',
                            'Medical Admin'
                          ]),
                        ],
                      ),
                    )),
                SizedBox(height: 6.h),
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
                        alignBlueTextButton("Terms and Conditions", () {}),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 3.5.w),
                    child:
                        alignBodyText(".", boxAlignment: Alignment.centerLeft)),
                SizedBox(height: 1.h),
                customButton("Register", () {
                  if (formValidation()) {
                    FocusScope.of(context).unfocus();
                    Authentication().createAccount(
                        name: name.text,
                        email: email.text,
                        pass: passController.text,
                        isAdmin: isAdmin.value,
                        adminType: adminType.value,
                        designation: designation.text);
                  }
                }),
              ],
            ),
          ),
        ),
        LoadingWidget()
      ],
    );
  }

  bool formValidation() {
    if (name.text.isEmpty || passController.text.isEmpty) {
      alertSnackbar("All fields are required");
      return false;
    } else if (!GetUtils.isEmail(email.text)) {
      alertSnackbar("Email is not valid");
      return false;
    } else if (passController.text.length < 6) {
      alertSnackbar("Password must be of atleast 6 charachters");
      return false;
    } else if (isAdmin.value) {
      if (designation.text.isEmpty) {
        alertSnackbar("Designation required");
        return false;
      } else
        return true;
    } else
      return true;
  }

  checkBoxTile(
      {required String text, required bool value, required onChange(v)}) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: 5.w),
          alignBodyText(text),
          Spacer(),
          Checkbox(
              value: value,
              onChanged: (v) {
                value = v!;
                onChange(v);
              })
        ],
      ),
    );
  }
}
