import 'package:flutter_application_1/src/model/youtube_video_result.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult?> loadViedos() async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UC0fiLCwTmAukotCXYnqfj0A&maxResults=10&order=date&videoDefinition=high&type=video&key=AIzaSyDYhH_cjUEggirSbGI03B1Vg7YPX7vCrqE";
    final res = await get(url);

    if (res.status.hasError) {
      return Future.error(res.statusText.toString());
    } else {
      if (res.body["items"] != null && res.body["items"].isNotEmpty) {
        return YoutubeVideoResult.fromJson(res.body);
      }
    }
  }
}
