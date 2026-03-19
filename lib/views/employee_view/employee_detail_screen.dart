import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmployeeDetailScreen extends StatefulWidget {
  const EmployeeDetailScreen({super.key});

  @override
  State<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade300, Colors.white],
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Feedback Submitted',
            style: GoogleFonts.playfairDisplay(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: .spaceAround,
                  crossAxisAlignment: .center,
                  children: [
                    Image.asset('assets/images/detailscreen.png', height: 150),
                    Text(
                      'Thank You For Your Feedback',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Your Feedback has been submitted successfull',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            StreamBuilder(
              stream: Supabase.instance.client
                  .from('feedbacks')
                  .stream(primaryKey: ['id']),
              builder: (context, snapshot) {
                final feedbacks = snapshot.data ?? [];
                return Expanded(
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(bottom: 10),
                    child: ListView.builder(
                      itemCount: feedbacks.length,
                      itemBuilder: (context, index) {
                        final currentfeedback = feedbacks[index];
                        return Padding(
                          padding: EdgeInsetsGeometry.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 450,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    right: 10,
                                    top: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: .end,
                                    children: [
                                      Text(
                                        DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                            currentfeedback['created_at'],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    left: 20,
                                    top: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.featured_play_list_outlined,
                                            size: 30,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '${currentfeedback['title'].toString().toUpperCase()}',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.playfairDisplay(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsGeometry.only(
                                          right: 20,
                                        ),
                                        child: Text(
                                          '${currentfeedback['description']}',

                                          style: GoogleFonts.playfairDisplay(
                                            fontSize: 17,
                                            color: Colors.grey.shade900,
                                          ),
                                          // textAlign: TextAlign.left,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Divider(),
                                Row(
                                  children: [
                                    SizedBox(width: 15),
                                    Text(
                                      'ID =',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${currentfeedback['id']}',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    SizedBox(width: 15),
                                    Text(
                                      'Status : ',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${currentfeedback['status']}',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 15),
                                    Text(
                                      'category : ',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${currentfeedback['category']}',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 17,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      15,
                                    ),
                                    child: Image.network(
                                      '${currentfeedback['imagelink']}',
                                      height: 200,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child; // Image fully loaded
                                            }
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Center(
                                              child: Icon(
                                                Icons.broken_image,
                                                size: 50,
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
