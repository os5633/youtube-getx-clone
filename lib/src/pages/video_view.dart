import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/youtube_view_controller.dart';

import 'package:html_unescape/html_unescape.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends GetView<YoutubeViewController> {
  VideoView({Key? key}) : super(key: key);
  final dynamic unescape = HtmlUnescape();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            YoutubePlayer(
              controller: controller.playerController!,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: <Widget>[
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    controller.playerController!.metadata.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onPressed: () {},
                ),
              ],
              onReady: () {},
              onEnded: (data) {},
            ),
            _discription(),
          ],
        ));
  }

  Expanded _discription() => Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              const SizedBox(
                height: 16,
              ),
              _subtitle(),
              const SizedBox(
                height: 16,
              ),
              _buttonList(),
              _line(),
              const SizedBox(
                height: 8,
              ),
              _owner()
            ],
          ),
        ),
      );

  Row _owner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                controller.videoController!.youtuberThumbnailUrl,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.videoController!.youtuber.value.snippet!.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "구독자 ${controller.videoController!.youtuber.value.statistics!.subscriberCount}명",
                  style: const TextStyle(fontSize: 13),
                )
              ],
            )
          ],
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "구독",
              style: TextStyle(
                color: Colors.red,
              ),
            ))
      ],
    );
  }

  Row _buttonList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _button(
            icon: Icons.thumb_up_alt_outlined,
            count: controller.videoController!.statistics.value.likeCount),
        _button(icon: Icons.thumb_down_alt_outlined, count: "싫어요"),
        _button(icon: Icons.share, count: "공유"),
        _button(icon: Icons.queue, count: "저장"),
      ],
    );
  }

  InkWell _button({Function()? onTap, IconData? icon, String? count}) {
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Icon(icon, color: Colors.black.withOpacity(0.6)),
              const SizedBox(
                height: 4,
              ),
              Text(
                count!,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ));
  }

  Text _subtitle() {
    return Text(
      controller.videoController!.video!.snippet.description,
    );
  }

  Container _line() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 1,
      color: const Color(0xffdddddd),
    );
  }

  Column _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          unescape.convert(controller.title),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "조회수 ${controller.videoController!.statistics.value.viewCount}회 · ${DateFormat("yyyy-MM-dd").format(controller.videoController!.video!.snippet.publishTime)}",
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
