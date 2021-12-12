import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/model/youtube_video_result.dart';

import 'package:flutter_application_1/src/repository/youtube_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _vidoeLoad();
    _event();
    super.onInit();
  }

  void _vidoeLoad() async {
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .loadViedos(youtubeResult.value.nextPageToken ?? "");
    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.isNotEmpty) {
      youtubeResult.update((youtube) {
        youtube!.nextPageToken = youtubeVideoResult.nextPageToken;
        youtube.items!.addAll(youtubeVideoResult.items!);
      });
    }
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPageToken != "") {
        _vidoeLoad();
      }
    });
  }
}
