import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoView extends StatelessWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        Get.parameters['videoId'].toString(),
        style: TextStyle(color: Colors.black),
      ),
    ));
  }
}
