import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/widget/custom_appbar.dart';
import 'package:flutter_application_1/src/widget/video.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: CustomAppBar(),
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed("/videoview/233");
                },
                child: const Video(),
              );
            }, childCount: 100),
          )
        ],
      ),
    );
  }
}
