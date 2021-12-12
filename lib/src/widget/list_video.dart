import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  const Video({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _thumbnail(),
        _simpDetailInfo(),
      ],
    );
  }

  Container _thumbnail() => Container(
        height: 250,
        color: Colors.grey,
      );

  Padding _simpDetailInfo() => Padding(
        padding: const EdgeInsets.all(16),
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
                      const Flexible(
                        child: Text(
                          "삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼 다시보기삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼 다시보기삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼 다시보기삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼삼시세끼 다시보기",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "TVN ENT · 조회수 9.9만회 · 10개월 전",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
