import 'package:flutter/material.dart';
import 'package:flutter_application_1/binding/init_binding.dart';
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
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
        ),
      ),
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: routes,
    );
  }
}
