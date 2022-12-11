
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/user.dart';
import '../../utils/widgets/text_field.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key, required this.user, this.readOnly = true})
      : super(key: key);

  final UserModel user;
  final bool readOnly;
  late final name = TextEditingController(text: user.name);
  late final address = TextEditingController(text: user.address);
  late final cnin = TextEditingController(text: user.cnic);
  late final bloodGroup = TextEditingController(text: user.bloodGroup);
  late final contact = TextEditingController(text: user.contactNo);
  late final email = TextEditingController(text: user.email);
  late final formStatus = TextEditingController(text: user.formStatus);
  late final type = TextEditingController(text: user.userType);
  late final fatherOrHusbandName =
      TextEditingController(text: user.fatherOrhusbandName);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: ListView(
        children: [
          textField("Name", name, readOnly: readOnly),
          textField("Father/Husband Name", fatherOrHusbandName,
              readOnly: readOnly),
          textField("Address", address, readOnly: readOnly),
          textField("CNIC", cnin, readOnly: readOnly),
          textField("EMAIL", email, readOnly: readOnly),
          textField("Blood Group", bloodGroup, readOnly: readOnly),
          textField("Contact #", contact, readOnly: readOnly),
          textField("Form Status", formStatus, readOnly: true),
          textField("User Status & Type", type, readOnly: true)
        ],
      ),
    );
  }
}
