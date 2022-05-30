import 'dart:io';
import 'package:app/models/subject_model.dart';
import 'package:app/other/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class ChapterDetailsPage extends StatefulWidget {
  const ChapterDetailsPage({Key? key}) : super(key: key);

  @override
  State<ChapterDetailsPage> createState() => _ChapterDetailsPageState();
}

class _ChapterDetailsPageState extends State<ChapterDetailsPage> {
  late String? sdCardPath;
  Future getData() async {
    var result = Get.arguments['chapterDetails'];
    sdCardPath = await getSDCardPath();
    return result;
  }

  getSDCardPath() async {
    // var _externalStorageDirectories = await getExternalStorageDirectories();
    // return _externalStorageDirectories![0]
    //     .toString()
    //     .replaceAll("Directory: '", "")
    //     .replaceAll("'", "");
    return "lib/assets";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: pageBackGround,
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                Chapter data = snapshot.data as Chapter;
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    title: Text(data.chapterName!),
                    centerTitle: true,
                  ),
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: Colors.black87.withOpacity(0.3),
                                      width: 3),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Text(
                                      'વિડિઓઝ',
                                      textScaleFactor: 2,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: data.videos!.isNotEmpty
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: data.videos!
                                                .map((e) => videoCard(
                                                    context,
                                                    e.videoName!,
                                                    e.videoPath!,
                                                    e.thumbNailPath!,
                                                    data.chapterName!))
                                                .toList())
                                        : const Text('No video to display'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Text(
                                    'ઇ રિસૉર્સીસ',
                                    textScaleFactor: 2,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(
                                      //   SnackBar(
                                      //     content: Text(
                                      //       '${sdCardPath!}${data.pdfs!.pdfPath}',
                                      //     ),
                                      //   ),
                                      // );
                                      Get.toNamed(
                                        '/viewPDF',
                                        arguments: {
                                          "pdfPath":
                                              '${sdCardPath!}${data.pdfs!.pdfPath}'
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 250,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 100,
                                              width: 70,
                                              child: Image.asset(
                                                  'lib/assets/pdf.png'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              data.pdfs!.pdfName!,
                                              textScaleFactor: 1.5,
                                              style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: Text('No video associated with this chapter'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            }),
      ),
    );
  }

  GestureDetector videoCard(context, String videoName, String? videoPath,
      String thumbNailPath, String chapterName) {
    return GestureDetector(
      onTap: () async {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(
        //       '${sdCardPath!}$videoPath',
        //     ),
        //   ),
        // );
        Get.toNamed(
          '/viewVideo',
          arguments: {"videoPath": '${sdCardPath!}$videoPath'},
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    '${sdCardPath!}$thumbNailPath',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 220,
                child: Text(
                  videoName,
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  chapterName,
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
