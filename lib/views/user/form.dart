import 'package:flutter/material.dart';
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
  late final name = TextEditingController(text: user.name);
  late final address = TextEditingController(text: user.address);
  late final cnin = TextEditingController(text: user.cnic);
  late final bloodGroup = TextEditingController(text: user.bloodGroup);
  late final contact = TextEditingController(text: user.contactNo);
  late final email = TextEditingController(text: user.email);
  late final district = TextEditingController(text: user.district);
  late final gender = TextEditingController(text: user.gender);
  late final licenseCategory =
      TextEditingController(text: user.licenseCategory);
  late final martialStatus = TextEditingController(text: user.martialStatus);
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
          textField("CNIC", cnin, readOnly: readOnly),
          textField("EMAIL", email, readOnly: true),
          textField("District", district, readOnly: readOnly),
          textField("Gender", gender, readOnly: readOnly),
          textField("Martail Status", martialStatus, readOnly: readOnly),
          textField("Religion", religion, readOnly: readOnly),
          textField("License Category", licenseCategory, readOnly: readOnly),
          textField("Blood Group", bloodGroup, readOnly: readOnly),
          textField("Contact #", contact, readOnly: readOnly),
          textField("Form Status", formStatus, readOnly: true),
          textField("User Status & Type", type, readOnly: true),
          //TODO take docs as input
          SizedBox(height: 1.h),
          Visibility(
              visible: submitButton,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: customButton("Submit", () async {
                  if (cnin.text.length < 13) {
                    alertSnackbar("Please provile valid CNIC");
                  } else if (fatherOrHusbandName.text.isEmpty) {
                    alertSnackbar("Please provile Father/husband name");
                  } else if (name.text.isEmpty ||
                      address.text.isEmpty ||
                      district.text.isEmpty ||
                      gender.text.isEmpty ||
                      martialStatus.text.isEmpty ||
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
                            district: district.text,
                            gender: gender.text,
                            martialStatus: martialStatus.text,
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
