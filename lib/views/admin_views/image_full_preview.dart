import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
class ImageFullPreview extends StatefulWidget {
  const ImageFullPreview({super.key});

  @override
  State<ImageFullPreview> createState() => _ImageFullPreviewState();
}

class _ImageFullPreviewState extends State<ImageFullPreview> {
  final current=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
          colors: [Colors.blue.shade200, Colors.white],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Image Full View',style: GoogleFonts.playfairDisplay(
            color: Colors.white
          ),),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
       Padding(
         padding: EdgeInsetsGeometry.only(left: 5,right: 5),
         child: ClipRRect(
         borderRadius: BorderRadiusGeometry.circular(10),
         child: Image.network('${current['imagelink']}',fit: BoxFit.cover,)),
       )
          ],
        ),
      ),
    );
  }
}
