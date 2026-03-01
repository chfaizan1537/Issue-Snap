import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class AdminFeedbackController extends GetxController {

  RxList<dynamic> feedbacks = <dynamic>[].obs;

  RxInt totalCount = 0.obs;
  RxInt unreadCount = 0.obs;
  RxInt readCount = 0.obs;
  RxInt resolvedCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchdata();
  }

  void fetchdata() {
    final supabase = Supabase.instance.client;

    supabase
        .from('feedbacks')
        .stream(primaryKey: ['id'])
        .listen((event) {

      feedbacks.assignAll(event);

      // 🔥 Recalculate counts whenever data changes
      totalCount.value = feedbacks.length;

      unreadCount.value =
          feedbacks.where((e) => e['status'] == 'unread').length;

      readCount.value =
          feedbacks.where((e) => e['status'] == 'read').length;

      resolvedCount.value =
          feedbacks.where((e) => e['status'] == 'resolved').length;
    });
  }

  Future<void> updateStatus(int id, String status) async {
    final supabase = Supabase.instance.client;

    await supabase
        .from('feedbacks')
        .update({'status': status})
        .eq('id', id);
  }
}