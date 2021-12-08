import 'package:flutter/material.dart';
import 'package:flutter_application_1/route/route.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Youtube Clone App",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      getPages: routes,
    );
  }
}
