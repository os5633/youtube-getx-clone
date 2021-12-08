import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/app_controller.dart';
import 'package:flutter_application_1/widget/app_bottom_navigation.dart';
import 'package:get/get.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      bottomNavigationBar: AppBottomNavigationBar(controller: controller),
    );
  }
}
