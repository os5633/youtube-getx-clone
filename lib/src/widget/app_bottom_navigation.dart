import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/app_controller.dart';
import 'package:get/get.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        elevation: 15,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          controller.changePageIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
            ),
            label: "탐색",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.black,
              size: 35,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions,
            ),
            label: "구독",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library,
            ),
            label: "보관함",
          ),
        ],
      ),
    );
  }
}
