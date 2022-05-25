import 'package:app/models/subject_model.dart';
import 'package:app/other/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterDetailsPage extends StatefulWidget {
  const ChapterDetailsPage({Key? key}) : super(key: key);

  @override
  State<ChapterDetailsPage> createState() => _ChapterDetailsPageState();
}

class _ChapterDetailsPageState extends State<ChapterDetailsPage> {
  Future getData() async {
    var result = Get.arguments['chapterDetails'];
    return result;
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
                    child: Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Text(
                                'View Videos',
                                textScaleFactor: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 1),
                              itemCount: data.videos!.length,
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  onTap: () => Get.toNamed('/viewVideo',
                                      arguments: {
                                        "videoPath": data.videos![i].videoPath
                                      }),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 150,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                data.videos![i].thumbNailPath!,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: 220,
                                            child: Text(
                                              data.videos![i].videoName!,
                                              textScaleFactor: 1.5,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 220,
                                            child: Text(
                                              data.chapterName!,
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
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Text(
                                'View PDF',
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
                                onTap: () => Get.toNamed('/viewPDF',
                                    arguments: {"pdfPath": data.pdfs!.pdfPath}),
                                child: Container(
                                  width: 250,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            height: 100,
                                            width: 70,
                                            child: Image.asset(
                                                'lib/assets/pdf.png')),
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
}
