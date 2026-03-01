import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:issuesnap/routes/routes_names.dart';
import 'package:lottie/lottie.dart';

import 'auth_views/public_auth_views/public_login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4),() => Get.offNamed(RoutesNames.roleselector),);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue.shade300,
      body: Container(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Lottie.asset('assets/animations/splash.json',height: 350,width: 400,),

            Text('Issue Snap',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
            Text('Give Feedback anonymously \n'
                ' Your Privacy is our Priority',style: TextStyle(color: Colors.black,fontSize: 17),)

          ],
        )
      ),
    );
  }
}

