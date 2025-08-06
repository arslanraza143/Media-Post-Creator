import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  //var isPasswordVisible = false.obs;
  //var isRememberMe = true.obs;
  var showError = false.obs;

  final postTitleController = TextEditingController();
  final postDescController = TextEditingController();

  void createPost() {
    if (postTitleController.text.isEmpty || postDescController.text.isEmpty) {
      showError.value = true;
    } else {
      print('Post created');
    }
  }

}
