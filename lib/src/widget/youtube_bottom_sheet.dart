// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YoutubeBottomSheet extends StatelessWidget {
  const YoutubeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            _header(),
            const SizedBox(
              height: 16,
            ),
            _itemButton(
                icon: Icons.upload,
                label: "동영상 업로드",
                onTap: () {
                  print("동영상 업로드");
                }),
            const SizedBox(
              height: 16,
            ),
            _itemButton(
              icon: Icons.stream_rounded,
              label: "실시간 스트리밍 시작",
              onTap: () {
                print("실시간 스트리밍 시작");
              },
            ),
          ],
        ),
      ),
    );
  }

  InkWell _itemButton({dynamic icon, String? label, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              size: 17,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(label!, style: const TextStyle(fontSize: 16))
        ],
      ),
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "만들기",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
        )
      ],
    );
  }
}
