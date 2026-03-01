import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:issuesnap/controller/auth_controller/public_auth_controller/login_controller.dart';
import 'package:issuesnap/routes/routes_names.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final controller = Get.put(LoginController());

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
            Image.asset('assets/images/login.jpg'),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15, top: 30),
              child: TextField(
                controller: controller.email,
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
                controller: controller.password,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed(RoutesNames.employeesignup);
                  },
                  child: Text(
                    "Don't Have a Account ! Register",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  controller.login();
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
