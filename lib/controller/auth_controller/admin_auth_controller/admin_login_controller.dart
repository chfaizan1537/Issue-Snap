import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:issuesnap/routes/routes_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class AdminLoginController extends GetxController {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  void login()async{
    final supabase=Supabase.instance.client;
    try{
      final response= await supabase.auth.signInWithPassword(password: password.text,email: email.text);

      if(response.user!=null){
        Get.snackbar('Success', 'Login Successfully',backgroundColor: Colors.green,snackPosition: SnackPosition.TOP);
        Get.toNamed(RoutesNames.adminhomescreen);

      }
      else {
        Get.snackbar(
          'Error',
          'Login failed. No user returned.',
          backgroundColor: Colors.red.shade400,
          colorText: Colors.white,
        );
      }

    }
    catch(e){
      Get.snackbar('Error ', '${e}',backgroundColor: Colors.red.shade400,
        colorText: Colors.white,);
    }

  }


}