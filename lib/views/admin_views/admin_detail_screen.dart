import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:issuesnap/routes/routes_names.dart';

class AdminDetailScreen extends StatefulWidget {
  AdminDetailScreen({super.key});

  @override
  State<AdminDetailScreen> createState() => _AdminDetailScreenState();
}

class _AdminDetailScreenState extends State<AdminDetailScreen> {
  var currentfeedback = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade300, Colors.white],
          begin: Alignment.topLeft,
          end: AlignmentGeometry.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Feedback detail',
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
          // grey container parent 
              Padding(
                padding: EdgeInsetsGeometry.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Colors.grey.shade300,
                  ),
                  height: 340,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsetsGeometry.all(5),
                          child: Row(
                          
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.numbers,size: 30,color: Colors.white,)),
                              SizedBox(width: 10,),
                          
                              Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    'Id',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '${currentfeedback['id']}',
                                    style: GoogleFonts.playfairDisplay(fontSize: 16),
                                  ),
                          
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsetsGeometry.all(5),
                          child: Row(
          
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.drive_file_rename_outline,size: 30,color: Colors.white,)),
                              SizedBox(width: 10,),
          
                              Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    'Title',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '${currentfeedback['title']}',
                                    style: GoogleFonts.playfairDisplay(fontSize: 16),
                                  ),
          
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsetsGeometry.all(5),
                          child: Row(
          
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.description_outlined,size: 30,color: Colors.white,)),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    'Description',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '${currentfeedback['description']}',
                                    style: GoogleFonts.playfairDisplay(fontSize: 16),
                                  ),
          
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsetsGeometry.all(5),
                          child: Row(
          
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.category,size: 30,color: Colors.white,)),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    'Category',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
          
                                  Text(
                                    '${currentfeedback['category']}',
                                    style: GoogleFonts.playfairDisplay(fontSize: 16),
                                  ),
          
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsetsGeometry.all(5),
                          child: Row(
          
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.category,size: 30,color: Colors.white,)),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    'Status',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
          
                                  Text(
                                    '${currentfeedback['status']}',
                                    style: GoogleFonts.playfairDisplay(fontSize: 16),
                                  ),
          
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: GestureDetector(
                    onTap: (){
                      Get.toNamed(RoutesNames.adminimageFullPreview,arguments: currentfeedback);
                    },
                    child: Image.network(
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return SizedBox(
                          height: 400,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          ),
                        );
                      },
                      '${currentfeedback['imagelink']}',height: 400,fit: BoxFit.cover,)),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
