import 'package:get/get.dart';
class RoleSelectorController extends GetxController {
  RxString isselected=''.obs;

 toogleborder(String role){
    isselected.value=role;
  }
}