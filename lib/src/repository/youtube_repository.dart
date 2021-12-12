import 'package:flutter_application_1/src/model/statistics.dart';
import 'package:flutter_application_1/src/model/youtube_video_result.dart';
import 'package:flutter_application_1/src/model/youtuber.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult?> loadViedos(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UC0fiLCwTmAukotCXYnqfj0A&maxResults=10&order=date&videoDefinition=high&type=video&key=AIzaSyDYhH_cjUEggirSbGI03B1Vg7YPX7vCrqE&pageToken=$nextPageToken";
    final res = await get(url);

    if (res.status.hasError) {
      return Future.error(res.statusText.toString());
    } else {
      if (res.body["items"] != null && res.body["items"].isNotEmpty) {
        return YoutubeVideoResult.fromJson(res.body);
      }
    }
  }

  Future<Statistics?> getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=snippet,statistics&key=AIzaSyDYhH_cjUEggirSbGI03B1Vg7YPX7vCrqE&id=$videoId";
    final res = await get(url);

    if (res.status.hasError) {
      return Future.error(res.statusText.toString());
    } else {
      if (res.body["items"] != null && res.body["items"].isNotEmpty) {
        Map<String, dynamic> data = res.body['items'][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber?> getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyDYhH_cjUEggirSbGI03B1Vg7YPX7vCrqE&id=$channelId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      } else {
        return null;
      }
    }
  }
}
