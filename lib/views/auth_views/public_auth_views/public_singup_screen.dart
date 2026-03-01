import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:issuesnap/controller/auth_controller/public_auth_controller/signup_controller.dart';

import '../../../routes/routes_names.dart';
class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final controller=Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text('Signup Screen',style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Image.asset('assets/images/signup.jpg'),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15,right: 15,top: 30),
              child: TextField(
                controller: controller.email,
                decoration: InputDecoration(
                    hintText: 'Enter email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15,right: 15,top: 30),
              child: TextField(
                controller: controller.password,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),

            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: .end,
              children: [
                TextButton(onPressed: (){
                  Get.offNamed(RoutesNames.employeelogin);
                }, child:
                Text('Already Have a Account ! Login',style: TextStyle(color: Colors.blue),) ),

              ],),
            SizedBox(height: 10,),

            SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(onPressed: (){
                controller.signup();
              },
                child:

                Text('Signup',style: TextStyle(color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold

                ),

                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300

                ),),
            )
          ],
        ),
      ),
    );
  }
}
