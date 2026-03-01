import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:issuesnap/routes/routes_initilization.dart';
import 'package:issuesnap/routes/routes_names.dart';
import 'package:issuesnap/views/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async{
  await Supabase.initialize(
    url: 'https://umxpncxawrssnodytugk.supabase.co',
    anonKey: 'sb_publishable_eTyhwbsyloz2jcKkIz1l5A_zvCrqBXN',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RoutesNames.splash,
      getPages:RoutesInitilization.pages,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

