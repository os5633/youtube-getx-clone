import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/video_controller.dart';
import 'package:flutter_application_1/src/model/video.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';

class VideoItem extends StatefulWidget {
  const VideoItem({Key? key, required this.video}) : super(key: key);

  final Video video;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  final dynamic unescape = HtmlUnescape();
  VideoConstroller? _videoConstroller;

  @override
  void initState() {
    _videoConstroller = Get.put(VideoConstroller(video: widget.video),
        tag: widget.video.id.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _thumbnail(),
        _simpDetailInfo(),
      ],
    );
  }

  Image _thumbnail() => Image.network(
        widget.video.snippet.thumbnails.high.url,
        fit: BoxFit.cover,
      );

  Padding _simpDetailInfo() => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
        child: Row(
          children: [
            Obx(
              () => CircleAvatar(
                backgroundImage:
                    NetworkImage(_videoConstroller!.youtuberThumbnailUrl),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          unescape.convert(widget.video.snippet.title),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                  Obx(
                    () => Text(
                      "${widget.video.snippet.channelTitle} · 조회수 ${_videoConstroller!.statistics.value.viewCount}회 · ${DateFormat("yyyy-MM-dd").format(widget.video.snippet.publishTime)}",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
