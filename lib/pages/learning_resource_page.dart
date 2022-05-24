import 'dart:convert';

import 'package:app/controllers/home_controller.dart';
import 'package:app/controllers/learning_resource_controller.dart';
import 'package:app/models/subject_model.dart';
import 'package:app/other/constants.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LearningResource extends StatefulWidget {
  const LearningResource({Key? key}) : super(key: key);

  @override
  State<LearningResource> createState() => _LearningResourceState();
}

class _LearningResourceState extends State<LearningResource> {
  final HomeController homeController = Get.find();
  final LearningResourceController controller = Get.find();
  ChewieController? chewieController;
  late VideoPlayerController? videoPlayerController;
  late List<Subjects>? list;

  Future<void> initializePlayer(String videoPath) async {
    videoPlayerController = VideoPlayerController.asset(videoPath);
    await Future.wait([videoPlayerController!.initialize()]);
    setUpChewie();
    controller.isPlayingVideo.value = true;
    setState(() {});
  }

  Future getJsonDataOfSubjects() async {
    final String response =
        await rootBundle.loadString('lib/assets/chapters.json');
    List<Subjects> result = subjectsFromMap(response);
    return result;
  }

  void setUpChewie() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
    );
  }

  startVideo(String? videoPath) {
    controller.isPDFOpen.value = false;
    initializePlayer(videoPath!);
    controller.isPlayingVideo.value = true;
  }

  startPDF(String? pdfPath) {
    controller.isPlayingVideo.value = false;
    controller.pdfPath.value = pdfPath!;
    controller.isPDFOpen.value = true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: pageBackGround,
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: floatingButton(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndDocked,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  topRow(context),
                  FutureBuilder(
                      future: getJsonDataOfSubjects(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          list = snapshot.data as List<Subjects>;

                          return Expanded(
                            child: SizedBox(
                              child: Align(
                                alignment: Alignment.center,
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.spaceEvenly,
                                  spacing: 40,
                                  children: list!
                                      .map((e) =>
                                          InkWell(child: subjectDisplayCard(e)))
                                      .toList(),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton floatingButton() {
    return FloatingActionButton(
        backgroundColor: primaryColor,
        highlightElevation: 12,
        hoverElevation: 8,
        onPressed: () {
          Get.offAndToNamed('/');
        },
        child: const Icon(Icons.logout_sharp));
  }

  SizedBox topRow(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'lib/assets/gshalaicon.png',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 144.0),
            child: Text(
              'Welcome ${homeController.userName.value.capitalizeFirst}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  TextButton subjectDisplayCard(Subjects e) {
    return TextButton(
      onPressed: () {
        Get.toNamed(
          '/subjectDetails',
          arguments: {"subjectName": e.subjectName},
          preventDuplicates: true,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              elevation: 5,
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 46.0,
                    right: 46.0,
                    top: 24.0,
                    bottom: 24.0,
                  ),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: SvgPicture.asset(
                      e.iconPath.toString(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              e.subjectName!,
              textScaleFactor: 1.5,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
