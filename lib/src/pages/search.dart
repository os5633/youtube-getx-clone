import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/youtube_search_controller.dart';
import 'package:flutter_application_1/src/widget/list_video.dart';
import 'package:get/get.dart';

class YoutubeSearch extends GetView<YoutubeSearchController> {
  const YoutubeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Youtube검색",
          ),
          onSubmitted: (value) {
            controller.search(value);
          },
        ),
      ),
      body: Obx(
        () => controller.youtubeVideoResult.value.items!.isNotEmpty
            ? _searchResultView()
            : _searchHistory(),
      ),
    );
  }

  Widget _searchResultView() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            controller.youtubeVideoResult.value.items!.length, (index) {
          return GestureDetector(
            onTap: () {
              //page route
              Get.toNamed(
                  "/videoview/${controller.youtubeVideoResult.value.items![index].id.videoId}");
            },
            child: VideoItem(
                video: controller.youtubeVideoResult.value.items![index]),
          );
        }),
      ),
    );
  }

  ListView _searchHistory() {
    return ListView(
      children: List.generate(
        controller.history.length,
        (index) => ListTile(
            onTap: () {
              controller.search(controller.history[index]);
            },
            leading: const Icon(Icons.history),
            title: Text(controller.history[index]),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )),
      ),
    );
  }
}
