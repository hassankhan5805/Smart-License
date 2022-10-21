import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackbar(String title, String text) {
  Get.snackbar(title, text,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white70);
}
