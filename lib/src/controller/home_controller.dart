import 'package:flutter_application_1/src/model/youtube_video_result.dart';
import 'package:flutter_application_1/src/repository/youtube_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult().obs;

  @override
  void onInit() {
    _vidoeLoad();
    super.onInit();
  }

  void _vidoeLoad() async {
    YoutubeVideoResult? youtubeVideoResult =
        await YoutubeRepository.to.loadViedos();
    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.isNotEmpty) {
      youtubeResult(youtubeVideoResult);
    }
  }
}
