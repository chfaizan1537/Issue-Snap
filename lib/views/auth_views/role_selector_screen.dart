import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:issuesnap/routes/routes_names.dart';

import '../../controller/auth_controller/role_selector_controller.dart';

class RoleSelectorScreen extends StatefulWidget {
  const RoleSelectorScreen({super.key});

  @override
  State<RoleSelectorScreen> createState() => _RoleSelectorScreenState();
}

class _RoleSelectorScreenState extends State<RoleSelectorScreen> {


  @override
  Widget build(BuildContext context) {
    final RoleSelectorController controller=Get.put(RoleSelectorController());
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children: [
          SizedBox(height: 200,),
         Row(
           mainAxisAlignment: .center,
           children: [
             CircleAvatar(
               backgroundColor: Colors.white,
               radius: 70,
               child: Icon(Icons.supervised_user_circle,size: 140,color: Colors.blue.shade700,),
             )
           ],
         ),
          SizedBox(height: 20,),
          Text('Choose Your Role ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 40,),
      Row(
        mainAxisAlignment: .spaceEvenly,
        children: [

          Obx(() {
            return GestureDetector(
              onTap: ()=>controller.toogleborder('employee'),
              onDoubleTap: (){
                Get.toNamed(RoutesNames.employeelogin);
              },
              child: Container(
                height: 220,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: controller.isselected.value=='employee'? 3:0,
                      color: controller.isselected.value=='employee'?
                          Colors.blue:
                          Colors.white
                    )
                ),
                child:
                Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Column(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      Icon(Icons.person_outline,size: 90,color: Colors.blue.shade900,),
                      Text('Employee',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),),
                      Text('Standard Employee Access',style: TextStyle(color: Colors.black,fontSize: 15),)

                    ],
                  ),
                ),
              ),
            );
          },),
          Obx(() => GestureDetector(
           onTap:()=> controller.toogleborder('admin'),
            onDoubleTap: (){
             Get.toNamed(RoutesNames.adminlogin);
            },

            child: Container(
              height: 220,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(30),
           border: Border.all(
             width: controller.isselected.value=='admin'? 3:0,
             color: controller.isselected.value=='admin'?
                 Colors.blue:
                  Colors.white
           )
              ),
              child:
              Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Column(
                  crossAxisAlignment: .center ,
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Icon(Icons.admin_panel_settings_outlined,size: 90,color: Colors.blue.shade900,),
                    Text('Admin',style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),

                    Text('Full Administrative Access',style: TextStyle(color: Colors.black,fontSize: 15),)



                  ],
                ),
              ),
            ),
          ),)
        ],
      )
          
        ],
      )
    );
  }
}
