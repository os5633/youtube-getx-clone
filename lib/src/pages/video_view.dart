import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoView extends StatelessWidget {
  const VideoView({Key? key}) : super(key: key);

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
            Container(
              height: 250,
              color: Colors.grey,
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
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                "https://yt3.ggpht.com/tKtfZSpmxJ69Feq07qhRsY8-_LV6fQXtSoeLlxnCbNIGtICFXUhceHQqqu2PS3xpnPF8tIVbzg=s68-c-k-c0x00ffffff-no-rj",
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "TVN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "구독자 3만명",
                  style: TextStyle(fontSize: 13),
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
        _button(icon: Icons.thumb_up_alt_outlined, count: "10"),
        _button(icon: Icons.thumb_down_alt_outlined, count: "10"),
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
              Text(count!)
            ],
          ),
        ));
  }

  Text _subtitle() {
    return const Text(
      "Thank you for listening, I hope you will have a good time here",
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
      children: const [
        Text(
          "삼시세끼 얼마나 재밌게요?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "TVN ENT · 조회수 9.9만회 · 10개월 전",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
