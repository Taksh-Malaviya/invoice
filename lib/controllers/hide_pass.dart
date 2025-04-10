import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HidePass extends GetxController {
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  final TextEditingController passwordController = TextEditingController();
}
