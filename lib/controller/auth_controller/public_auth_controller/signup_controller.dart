import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signup() async {
    final supabase = Supabase.instance.client;
    try {
      if (email.text.isEmpty && password.text.isEmpty) {
        Get.snackbar(
          'Error ',
          'Please enter required fields',
          colorText: Colors.white,
          backgroundColor: Colors.red.shade300,
        );
      } else {
        await supabase.auth.signUp(password: password.text, email: email.text);
        Get.snackbar(
          'Success',
          'Signup Successfully',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error ',
        '${e}',
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
    }
  }
}
