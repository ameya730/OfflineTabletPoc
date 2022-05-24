import 'package:app/controllers/dashboard_controller.dart';
import 'package:app/models/subject_model.dart';
import 'package:chewie/chewie.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:video_player/video_player.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final DashBoardController controller = Get.find();
  ChewieController? chewieController;
  late VideoPlayerController? videoPlayerController;

  Future<void> initializePlayer(String videoPath) async {
    videoPlayerController = VideoPlayerController.asset(videoPath);
    await Future.wait([videoPlayerController!.initialize()]);
    setUpChewie();
    controller.isPlayingVideo.value = true;
    setState(() {});

    // ..initialize()
    //     .then((_) => {videoPlayerController!.play(), });
  }

  void setUpChewie() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
    );
  }

  final List<Subjects> subjectListOther = [
    Subjects(
      subjects: "English",
      isExpanded: false,
      chapters: [
        Chapters(
            isExpanded: false,
            chapterName: "Macbeth",
            videoName: "Macbeth Video",
            videoPath: "lib/assets/birds.mp4",
            pdfName: "Macbeth PDF",
            pdfPath: "lib/assets/Document 246.pdf"),
        Chapters(
            isExpanded: false,
            chapterName: "Othello",
            videoName: "Othello Video",
            videoPath: "lib/assets/Reference-video.mp4",
            pdfName: "Othello PDF",
            pdfPath: "lib/assets/Ashvattha_khs_form.pdf"),
        Chapters(
            isExpanded: false,
            chapterName: "Taming of the shrew",
            videoName: "Taming Video",
            videoPath: "lib/assets/birds.mp4",
            pdfName: "Taming PDF",
            pdfPath: "lib/assets/Document 246.pdf"),
      ],
    ),
    Subjects(
      subjects: "Maths",
      isExpanded: false,
      chapters: [
        Chapters(
            isExpanded: false,
            chapterName: "Fermat's Last Theorem",
            videoName: "Fermat's Video",
            pdfName: "Fermat's PDF"),
        Chapters(
            isExpanded: false,
            chapterName: "What are tensors",
            videoName: "What are tensors Video",
            pdfName: "What are tensors PDF"),
        Chapters(
            isExpanded: false,
            chapterName: "Fractal Geometry",
            videoName: "Fractal Video",
            pdfName: "Fractal PDF"),
      ],
    ),
    Subjects(
      subjects: "Science",
      isExpanded: false,
      chapters: [
        Chapters(
            isExpanded: false,
            chapterName: "Flow of time",
            videoName: "Flow of time Video",
            pdfName: "Flow of time PDF"),
        Chapters(
            isExpanded: false,
            chapterName: "What are quasars",
            videoName: "Quasars Video",
            pdfName: "Quasars PDF"),
        Chapters(
            isExpanded: false,
            chapterName: "Quarks and colors",
            videoName: "Quarks Video",
            pdfName: "Quarks PDF"),
      ],
    ),
  ];

  startVideo(String? videoPath) {
    controller.isPDFOpen.value = false;
    initializePlayer(videoPath!);
    controller.isPlayingVideo.value = true;
  }

  startPDF(String? pdfPath) {
    controller.isPlayingVideo.value = false;
    controller.pdfPath.value = pdfPath!;
    print(controller.pdfPath.value);
    controller.isPDFOpen.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                elevation: 10,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff7B68EE).withOpacity(0.2),
                  ),
                  width: 300,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Subjects & Chapters',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: subjectListOther.length,
                            itemBuilder: (context, index) {
                              return ExpandablePanel(
                                header: Card(
                                  color: const Color(0xff20B2AA).withOpacity(1),
                                  child: ListTile(
                                    title: Text(
                                      subjectListOther[index]
                                          .subjects
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                collapsed: const SizedBox(),
                                expanded: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: subjectListOther[index]
                                        .chapters!
                                        .length,
                                    itemBuilder: (context, i) {
                                      return ExpandablePanel(
                                        header: Card(
                                          color: const Color(0xff20B2AA)
                                              .withOpacity(0.5),
                                          child: ListTile(
                                            title: Text(
                                              subjectListOther[index]
                                                  .chapters![i]
                                                  .chapterName!
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        collapsed: const SizedBox(),
                                        expanded: Column(
                                          children: [
                                            Card(
                                              color: Colors.white10,
                                              child: ListTile(
                                                onTap: () => startVideo(
                                                  subjectListOther[index]
                                                      .chapters![i]
                                                      .videoPath,
                                                ),
                                                title: Text(
                                                  subjectListOther[index]
                                                      .chapters![i]
                                                      .videoName!,
                                                ),
                                              ),
                                            ),
                                            Card(
                                              color: Colors.white10,
                                              child: ListTile(
                                                onTap: () => startPDF(
                                                  subjectListOther[index]
                                                      .chapters![i]
                                                      .pdfPath,
                                                ),
                                                title: Text(
                                                  subjectListOther[index]
                                                      .chapters![i]
                                                      .pdfName!,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => controller.isPlayingVideo.value
                    ? Expanded(
                        child: Container(
                          color: Colors.black,
                          child: chewieController != null
                              ? Chewie(controller: chewieController!)
                              : const SizedBox(),
                        ),
                      )
                    : const SizedBox(),
              ),
              Obx(
                () => controller.isPDFOpen.value
                    ? Expanded(
                        child: Container(
                          color: Colors.black,
                          child: SfPdfViewer.asset(
                              controller.pdfPath.value.toString()),
                        ),
                      )
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
