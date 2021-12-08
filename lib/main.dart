import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/binding/init_binding.dart';
import 'package:flutter_application_1/src/route/route.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Youtube Clone App",
      theme: ThemeData(
        primaryColor: Colors.blue,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
      ),
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: routes,
    );
  }
}
