import 'package:flutter_application_1/src/model/statistics.dart';
import 'package:flutter_application_1/src/model/video.dart';
import 'package:flutter_application_1/src/model/youtuber.dart';
import 'package:flutter_application_1/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoConstroller extends GetxController {
  Video? video;

  VideoConstroller({this.video});

  Rx<Statistics> statistics = Statistics().obs;

  Rx<Youtuber> youtuber = Youtuber().obs;
  @override
  void onInit() async {
    Statistics? loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video!.id.videoId);
    statistics(loadStatistics);

    Youtuber? loadYoutuber = await YoutubeRepository.to
        .getYoutuberInfoById(video!.snippet.channelId);
    youtuber(loadYoutuber);

    super.onInit();
  }

  String get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null)
      return "https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg";

    return youtuber.value.snippet!.thumbnails.medium.url;
  }
}
