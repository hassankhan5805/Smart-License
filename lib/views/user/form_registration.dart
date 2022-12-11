import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/controllers/user_controller.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/widgets/loading.dart';
import 'form.dart';

class FormRegistration extends StatelessWidget {
  FormRegistration({super.key});
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: appBar(
              context: context,
              title: "Form Registration",
              hideBackButton: true),
          body: Center(
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(userCntr.user.value.formComments.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red))),
                Obx(() => UserForm(
                    user: userCntr.user.value,
                    readOnly: false,
                    submitButton: true,
                    height: 80.h)),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ),
        LoadingWidget()
      ],
    );
  }
}
