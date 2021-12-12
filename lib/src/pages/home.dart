import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/home_controller.dart';
import 'package:flutter_application_1/src/widget/custom_appbar.dart';
import 'package:flutter_application_1/src/widget/list_video.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            const SliverAppBar(
              title: CustomAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                          "/videoview/${controller.youtubeResult.value.items![index].id.videoId}");
                    },
                    child: VideoItem(
                        video: controller.youtubeResult.value.items![index]),
                  );
                },
                childCount: controller.youtubeResult.value.items == null
                    ? 0
                    : controller.youtubeResult.value.items!.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
