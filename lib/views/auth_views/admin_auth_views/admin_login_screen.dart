import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:issuesnap/controller/auth_controller/admin_auth_controller/admin_login_controller.dart';
import 'package:issuesnap/controller/auth_controller/public_auth_controller/login_controller.dart';
import 'package:issuesnap/routes/routes_names.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final admincontroller = Get.put(AdminLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text(
          'Login Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset('assets/images/admin.png',height: 300,),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15, top: 30),
              child: TextField(
                controller: admincontroller.email,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15, top: 30),
              child: TextField(
                controller: admincontroller.password,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  admincontroller.login();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
