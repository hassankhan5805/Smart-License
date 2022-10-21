import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  final Rx<TextEditingController> email =
      TextEditingController(text: "").obs;
  final Rx<TextEditingController> name =
      TextEditingController(text: "").obs;
}
