// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielproject/utility/app_constant.dart';

class AppSnackBar {
  final String title;
  final String message;
  AppSnackBar({
    required this.title,
    required this.message,
  });

  void normalSnackbar() {
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }

  void errorSnackbar() {
    Get.snackbar(title, message,
        backgroundColor: AppConstant.bgColor,
        colorText: Colors.black87,
        duration: Duration(seconds: 5));
  }
}
