import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/explore.dart';
import 'package:flutter_application_1/src/pages/home.dart';
import 'package:flutter_application_1/src/pages/library.dart';
import 'package:flutter_application_1/src/pages/subscribe.dart';
import 'package:flutter_application_1/src/widget/app_bottom_navigation.dart';
import 'package:get/get.dart';
import 'controller/app_controller.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.home:
            return const Home();
          case RouteName.explore:
            return const Explore();
          case RouteName.subs:
            return const Subscribe();
          case RouteName.library:
            return const Library();
          case RouteName.add:
            break;
        }
        return const Home();
      }),
      bottomNavigationBar: AppBottomNavigationBar(controller: controller),
    );
  }
}
