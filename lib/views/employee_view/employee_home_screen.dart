import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:issuesnap/controller/auth_controller/public_auth_controller/login_controller.dart';
import 'package:issuesnap/routes/routes_names.dart';
import '../../controller/bottomnav_controller/bottom_navigation_bar.dart';
import '../../controller/public_controller/feedback_controller.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({super.key});

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  EmployeeNavController con = Get.put(EmployeeNavController());
  LoginController controller = Get.put(LoginController());
  FeedbackController fcont = Get.put(FeedbackController());
  void showImagePickerSheet() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                Get.back();
                fcont.pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Get.back();
                fcont.pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

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
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: Icon(Icons.logout, color: Colors.white, size: 30),
            ),
          ],
          title: Text(
            'Feedback',
            style: GoogleFonts.playfairDisplay(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 17),
              Row(
                mainAxisAlignment: .center,
                children: [
                  // main parent container
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, 6),
                          blurRadius: 16,
                          spreadRadius: 3,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                        colors: [Color(0xFFC9D6F2), Color(0xFFE9E6F3)],
                      ),

                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 680,
                    width: 340,
                    child:
                        // submit feedback column
                        Column(
                          children: [
                            // submit feedback text
                            Row(
                              mainAxisAlignment: .start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    left: 15,
                                    // top: 15,
                                  ),
                                  child: Text(
                                    'Submit Feedback',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: .end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(RoutesNames.employeedetail);
                                  },
                                  child: Text(
                                    'See My Feedbacks ',
                                    style: GoogleFonts.playfairDisplay(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                        color: Colors.blue.shade400

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //  child grey feedback container
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: Offset(0, 6),
                                    blurRadius: 16,
                                    spreadRadius: 3,
                                  ),
                                ],
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 570,
                              width: 315,
                              child: Padding(
                                padding: EdgeInsetsGeometry.only(
                                  top: 15,
                                  left: 15,
                                  right: 15,
                                ),
                                child: Column(
                                  children: [
                                    //title text
                                    Row(
                                      children: [
                                        Text(
                                          'Title',
                                          style: GoogleFonts.playfairDisplay(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    // title textfield
                                    TextField(
                                      controller: fcont.title,

                                      decoration: InputDecoration(
                                        labelText: 'Enter title',
                                        labelStyle: GoogleFonts.playfairDisplay(
                                          color: Colors.black,
                                          fontSize: 17,
                                        ),

                                        filled: true,
                                        fillColor: Colors.white,

                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 9),
                                    // description text
                                    Row(
                                      children: [
                                        Text(
                                          'Description',
                                          style: GoogleFonts.playfairDisplay(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    //description textfield
                                    TextField(
                                      controller: fcont.description,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          bottom: 60,
                                          left: 10,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText:
                                            'Describe the issue / suggesstion ',
                                        labelStyle: GoogleFonts.playfairDisplay(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    //category text
                                    Row(
                                      children: [
                                        Text(
                                          'Category',
                                          style: GoogleFonts.playfairDisplay(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Obx(
                                      () => Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        height: 50,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsetsGeometry.all(10),
                                          child: DropdownButton<FeedbackCategory>(
                                            dropdownColor: Colors.blue.shade50,
                                            underline: SizedBox(),
                                            value: fcont.selectedCategory.value,
                                            items: FeedbackCategory.values.map((
                                              cat,
                                            ) {
                                              return DropdownMenuItem(
                                                value: cat,
                                                child: Text(
                                                  cat.name,
                                                  style:
                                                      GoogleFonts.playfairDisplay(
                                                        color: Colors.black,
                                                      ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              fcont.selectedCategory.value =
                                                  value!;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 9),

                                    GestureDetector(
                                      onTap: ()  {
                                        showImagePickerSheet();
                                      },

                                      child: Obx(
                                        () => GestureDetector(
                                          onTap: ()  {
                                             showImagePickerSheet();
                                          },
                                          child: DottedBorder(
                                            options: RectDottedBorderOptions(
                                              dashPattern: [10, 10],
                                              strokeWidth: 1,
                                            ),
                                            child:
                                                fcont.pickedImage.value != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                    child: Image.file(
                                                      fcont.pickedImage.value!,
                                                      height: 150,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Container(
                                                    color: Colors.white,
                                                    height: 150,
                                                    width: double.infinity,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          CupertinoIcons
                                                              .camera_fill,
                                                          size: 60,
                                                          color: Colors.grey,
                                                        ),
                                                        Text(
                                                          'Upload Image',
                                                          style:
                                                              GoogleFonts.playfairDisplay(
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Attach Photos (Optional)',
                                                          style:
                                                              GoogleFonts.playfairDisplay(
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),

                                    SizedBox (
                                      height: 50,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          fcont.addfeedbacks(
                                            fcont.title.text,
                                            fcont.description.text,
                                            fcont.selectedCategory.value.name,
                                          );
                                        },
                                        child: Text(
                                          'Submit',
                                          style: GoogleFonts.playfairDisplay(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
