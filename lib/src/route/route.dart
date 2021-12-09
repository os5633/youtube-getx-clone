import 'package:flutter_application_1/src/app.dart';
import 'package:flutter_application_1/src/pages/video_view.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
    name: "/",
    page: () => const App(),
  ),
  GetPage(
    name: "/videoview/:videoId",
    page: () => const VideoView(),
  ),
];
