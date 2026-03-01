import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:issuesnap/routes/routes_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../controller/admin_controller/admin_feedback_controller.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  AdminFeedbackController contr = Get.put(AdminFeedbackController());
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


        title: Text(
            'Feedbacks List',
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Divider(color: Colors.white),
            SizedBox(height: 10),
            // side by side containers
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.black.withOpacity(0.4),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(0, 6),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 120,
                  width: 160,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsetsGeometry.all(5),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.messenger_outline,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Total',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Obx(
                            () => Text(
                              '${contr.totalCount}',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.black.withOpacity(0.4),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(0, 6),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 120,
                  width: 160,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsetsGeometry.all(5),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              CupertinoIcons.clock,
                              color: Colors.amber.shade800,
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Unread',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Obx(
                            () => Text(
                              '${contr.unreadCount}',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .start,

              children: [
                SizedBox(width: 20),
                Text(
                  'Recent Feedbacks',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.white),
            StreamBuilder(
              stream: Supabase.instance.client
                  .from('feedbacks')
                  .stream(primaryKey: ['id']),
              builder: (context, snapshot) {
                final feedbacks = snapshot.data ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemCount: feedbacks.length,
                    itemBuilder: (context, index) {
                      final currentfeedback = feedbacks[index];
                      return Padding(
                        padding: EdgeInsetsGeometry.only(
                          left: 10,
                          right: 10,
                          top: 5,
                        ),
                        child: Card(
                          color: Colors.grey.shade200,
                          elevation: 5,
                          child: ListTile(
                            onTap: () {
                              Get.toNamed(
                                RoutesNames.admindetailscreen,
                                arguments: currentfeedback,
                              );
                            },

                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                '${currentfeedback['imagelink']}',
                              ),
                            ),
                            trailing: PopupMenuButton<String>(
                              onSelected: (value) {
                                contr.updateStatus(
                                  currentfeedback['id'],
                                  value,
                                );
                              },
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'read',
                                  child: Text('Mark as Read'),
                                ),
                                PopupMenuItem(
                                  value: 'resolved',
                                  child: Text('Mark as Resolved'),
                                ),
                                PopupMenuItem(
                                  value: 'unread',
                                  child: Text('Mark as Unread'),
                                ),
                              ],
                            ),
                            title: Text(
                              '${currentfeedback['title'].toString().toUpperCase()}',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${currentfeedback['description']}',
                              style: GoogleFonts.playfairDisplay(fontSize: 15),
                            )
                          ),
                        ),
                      );
                    },
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
