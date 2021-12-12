import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/model/video.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';

class VideoItem extends StatelessWidget {
  VideoItem({Key? key, required this.video}) : super(key: key);

  final Video video;
  final dynamic unescape = HtmlUnescape();

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
        video.snippet.thumbnails.high.url,
        fit: BoxFit.cover,
      );

  Padding _simpDetailInfo() => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://yt3.ggpht.com/tKtfZSpmxJ69Feq07qhRsY8-_LV6fQXtSoeLlxnCbNIGtICFXUhceHQqqu2PS3xpnPF8tIVbzg=s68-c-k-c0x00ffffff-no-rj",
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
                          unescape.convert(video.snippet.title),
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
                  Text(
                    "${video.snippet.channelTitle} · 조회수 9.9만회 · ${DateFormat("yyyy-MM-dd").format(video.snippet.publishTime)}",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
