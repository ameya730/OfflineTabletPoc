import 'dart:io';

import 'package:app/controllers/view_video_controller.dart';
import 'package:app/other/constants.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ViewVideoPage extends StatefulWidget {
  const ViewVideoPage({Key? key}) : super(key: key);

  @override
  State<ViewVideoPage> createState() => _ViewVideoPageState();
}

class _ViewVideoPageState extends State<ViewVideoPage> {
  ChewieController? chewieController;
  late VideoPlayerController? videoPlayerController;
  final ViewVideoController controller = Get.find();

  Future getData() async {
    String? videoPath = await Get.arguments['videoPath'];
    print(videoPath);
    return videoPath;
  }

  Future<void> initializePlayer(String? videoPath) async {
    videoPlayerController = VideoPlayerController.file(File(videoPath!));
    await Future.wait([videoPlayerController!.initialize()]);
    setUpChewie();
    controller.isVideoLoaded.value = true;
    setState(() {});
  }

  void setUpChewie() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: pageBackGround,
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              if (controller.isVideoLoaded.value == false) {
                initializePlayer(snapshot.data!.toString());
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                return SafeArea(
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    backgroundColor: Colors.transparent,
                    body: chewieController != null
                        ? Chewie(controller: chewieController!)
                        : const SizedBox(),
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          }),
    );
  }
}
