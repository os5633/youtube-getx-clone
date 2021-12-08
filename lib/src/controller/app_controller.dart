import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/widget/youtube_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

enum RouteName { home, explore, add, subs, library }

class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(const YoutubeBottomSheet());
  }
}
