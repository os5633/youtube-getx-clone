import 'package:flutter_application_1/src/app.dart';
import 'package:flutter_application_1/src/controller/youtube_search_controller.dart';
import 'package:flutter_application_1/src/controller/youtube_view_controller.dart';
import 'package:flutter_application_1/src/pages/search.dart';
import 'package:flutter_application_1/src/pages/video_view.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
    name: "/",
    page: () => const App(),
  ),
  GetPage(
    name: "/videoview/:videoId",
    page: () => VideoView(),
    binding: BindingsBuilder(
      () => Get.lazyPut<YoutubeViewController>(
        () => YoutubeViewController(),
      ),
    ),
  ),
  GetPage(
    name: "/search",
    page: () => const YoutubeSearch(),
    binding: BindingsBuilder(
      () => Get.lazyPut<YoutubeSearchController>(
        () => YoutubeSearchController(),
      ),
    ),
  ),
];
