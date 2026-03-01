import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:issuesnap/routes/routes_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

enum FeedbackCategory { Employee, Manager, Service, Company }

String categoryToString(FeedbackCategory category) {
  return category.name;
}

class FeedbackController extends GetxController {
  final title = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  var pickedImage = Rx<File?>(null);
 String imgurl='';
 var selectedCategory = FeedbackCategory.Employee.obs;


  Future<void> addfeedbacks(String titl, String desc, String cate) async {

    final titleTrimmed = titl.trim();
    final descTrimmed = desc.trim();

    if (titleTrimmed.isEmpty || descTrimmed.isEmpty) {
      Get.snackbar(
        'Error',
        'Title and Description are required',
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
      return;
    }
    String? imageUrl;
    if (pickedImage.value != null) {
      imageUrl = await uploadpic();
    }

    try {
      await Supabase.instance.client.from('feedbacks').insert({
        'title': titleTrimmed,
        'description': descTrimmed,
        'category': cate,
        'imagelink': imageUrl,
      });

      Get.snackbar(
        'Success',
        'Feedback submitted successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );

      resetForm();
      Get.toNamed(RoutesNames.employeedetail);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
      );
    }
  }

  Future pickImage(ImageSource source) async {
    try {
      final result = await ImagePicker().pickImage(source: source);
      if (result != null) {
        pickedImage.value = File(result.path);
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }


  Future<String?> uploadpic() async {
    final fileName = 'feedback_${DateTime.now().millisecondsSinceEpoch}.jpg';
    try {
      await Supabase.instance.client.storage
          .from('feedback_images')
          .upload('$fileName', pickedImage.value!);
       imgurl = Supabase.instance.client.storage
          .from('feedback_images')
          .getPublicUrl(fileName);
      return imgurl;
    } catch (e) {
      Get.snackbar(
        'Error',
        "$e",
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
      );
    }
  }
  void resetForm() {
    title.clear();
    description.clear();
    pickedImage.value = null;
    selectedCategory.value = FeedbackCategory.Employee;
  }



}
