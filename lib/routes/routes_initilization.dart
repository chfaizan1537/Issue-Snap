import 'package:get/get.dart';
import 'package:issuesnap/routes/routes_names.dart';
import 'package:issuesnap/views/admin_views/admin_detail_screen.dart';
import 'package:issuesnap/views/auth_views/admin_auth_views/admin_login_screen.dart';
import 'package:issuesnap/views/auth_views/public_auth_views/public_login_screen.dart';
import 'package:issuesnap/views/employee_view/employee_detail_screen.dart';
import 'package:issuesnap/views/splash_screen.dart';

import '../views/admin_views/admin_home_screen.dart';
import '../views/admin_views/image_full_preview.dart';
import '../views/employee_view/employee_home_screen.dart';

import '../views/auth_views/public_auth_views/public_singup_screen.dart';
import '../views/auth_views/role_selector_screen.dart';

class RoutesInitilization {
  static final pages = [
    GetPage(name: RoutesNames.splash, page: () => SplashScreen()),
    GetPage(name: RoutesNames.employeelogin, page: () => Login_Screen()),
    GetPage(name: RoutesNames.employeesignup, page: () => SingupScreen()),
  GetPage(name: RoutesNames.employeehome, page: () => EmployeeHomeScreen()),
  GetPage(name: RoutesNames.roleselector, page: () => RoleSelectorScreen()),
    GetPage(name: RoutesNames.adminlogin, page: () => AdminLoginScreen()),
    GetPage(name: RoutesNames.adminhomescreen, page: () =>AdminHomeScreen()),
    GetPage(name: RoutesNames.employeedetail, page: () =>EmployeeDetailScreen()),
    GetPage(name: RoutesNames.admindetailscreen, page: () =>AdminDetailScreen()),
    GetPage(name: RoutesNames.adminimageFullPreview, page: () =>ImageFullPreview()),



  ];
}
