import 'package:flutter_application_1/src/model/youtube_video_result.dart';
import 'package:flutter_application_1/src/repository/youtube_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoutubeSearchController extends GetxController {
  String key = "searchKey";
  RxList<String> history = RxList<String>.empty(growable: true);
  Set<String>? originHistory = {};
  SharedPreferences? _profs;

  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() async {
    _profs = await SharedPreferences.getInstance();
    List<dynamic>? initData = _profs!.get(key) as List?;
    originHistory!.addAll(initData!.map<String>((_) => _.toString()).toList());
    history(originHistory!.toList());

    super.onInit();
  }

  void search(String search) {
    history.clear();
    originHistory!.add(search);
    history.addAll(originHistory!.toList());
    _profs!.setStringList(key, originHistory!.toList());
    _searchYoutube(search);
  }

  void _searchYoutube(String search) async {
    YoutubeVideoResult? youtubeVideoResultFromServer =
        await YoutubeRepository.to.search(search, "");
    youtubeVideoResult(youtubeVideoResultFromServer);
  }
}
