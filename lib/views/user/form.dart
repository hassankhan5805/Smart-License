import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/constants/strings.dart';
import 'package:smartlicense/controllers/loading.dart';
import 'package:smartlicense/services/reception.dart';
import 'package:smartlicense/utils/snackbar.dart';

import '../../model/user.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/text_field.dart';

class UserForm extends StatelessWidget {
  UserForm(
      {Key? key,
      required this.user,
      required this.height,
      this.readOnly = true,
      this.submitButton = false})
      : super(key: key);

  final UserModel user;
  final bool submitButton;
  final double height;
  final bool readOnly;
  late final Rx<String> gender = user.gender!.obs;
  late final Rx<String> martialStatus = user.martialStatus!.obs;
  late final name = TextEditingController(text: user.name);
  late final address = TextEditingController(text: user.address);
  late final cnin = TextEditingController(text: user.cnic);
  late final bloodGroup = TextEditingController(text: user.bloodGroup);
  late final contact = TextEditingController(text: user.contactNo);
  late final email = TextEditingController(text: user.email);
  late final district = TextEditingController(text: user.district);
  late final licenseCategory =
      TextEditingController(text: user.licenseCategory);
  late final religion = TextEditingController(text: user.religion);
  late final formStatus = TextEditingController(text: user.formStatus);
  late final type = TextEditingController(text: user.userType);
  late final fatherOrHusbandName =
      TextEditingController(text: user.fatherOrhusbandName);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView(
        children: [
          textField("Official Name", name, readOnly: readOnly),
          textField("Father/Husband Name", fatherOrHusbandName,
              readOnly: readOnly),
          textField("Address", address, readOnly: readOnly),
          textField("CNIC", cnin,
              readOnly: readOnly,
              textInputType: TextInputType.number,
              maxLength: 13),
          Visibility(
            visible: !submitButton,
            child: RadioButtons(
                rxx: gender,
                title: "Gender",
                options: ["Male", "Female", "Other"]),
          ),
          textField("EMAIL", email, readOnly: true),
          RadioButtons(
              rxx: martialStatus,
              title: "Martail Status",
              options: ["Married", "Unmarried"]),
          Visibility(
            visible: !submitButton,
            child: textField("District", district, readOnly: true),
          ),
          textField("Religion", religion, readOnly: readOnly),
          textField("License Category", licenseCategory, readOnly: readOnly),
          textField("Blood Group", bloodGroup, readOnly: readOnly),
          textField("Contact #", contact, readOnly: readOnly),
          //TODO take docs as input
          SizedBox(height: 1.h),
          Visibility(
              visible: submitButton,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: customButton("Submit", () async {
                  if (!GetUtils.isNum(cnin.text) && cnin.text.length != 13) {
                    alertSnackbar("Please provile valid CNIC");
                  } else if (fatherOrHusbandName.text.isEmpty) {
                    alertSnackbar("Please provile Father/husband name");
                  } else if (name.text.isEmpty ||
                      address.text.isEmpty ||
                      martialStatus.value.isEmpty ||
                      religion.text.isEmpty ||
                      contact.text.isEmpty ||
                      licenseCategory.text.isEmpty) {
                    alertSnackbar("Please provide all the details");
                  } else {
                    loading(true);
                    await Reception().updateFormRelevance(
                        user.copyWith(
                            name: name.text,
                            address: address.text,
                            cnic: cnin.text,
                            bloodGroup: bloodGroup.text,
                            fatherOrhusbandName: fatherOrHusbandName.text,
                            district:
                                cnin.text[4] == "1" ? "Abbottabad" : "Other",
                            gender: int.parse(cnin.text[cnin.text.length - 1]) %
                                        2 ==
                                    0
                                ? "Female"
                                : "Male",
                            martialStatus: martialStatus.value,
                            religion: religion.text,
                            licenseCategory: licenseCategory.text,
                            contactNo: contact.text,
                            userType: AllStrings.regWaitingType,
                            appliedOn: DateTime.now().toString(),
                            formStatus: "Submitted to Admin"),
                        true);
                    await Reception().userReception();
                    loading(false);
                  }
                }, bgColor: (Colors.white), textColor: Colors.blue),
              ))
        ],
      ),
    );
  }
}

class RadioButtons extends StatelessWidget {
  const RadioButtons(
      {required this.rxx,
      required this.title,
      required this.options,
      super.key});
  final Rx<String> rxx;
  final String title;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      rxx.value;
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            SizedBox(
              height: options.length * 8.h,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: options.length,
                  itemBuilder: ((context, index) => RadioListTile(
                        title: Text(options[index]),
                        value: options[index],
                        groupValue: rxx.value,
                        onChanged: (value) {
                          rxx.value = value.toString();
                        },
                      ))),
            ),
          ],
        ),
      );
    });
  }
}
