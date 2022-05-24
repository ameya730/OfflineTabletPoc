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
                        color: Colors.black87,
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
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.videos!.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: ListTile(
                                      onTap: () =>
                                          Get.toNamed('/viewVideo', arguments: {
                                        "videoPath": data.videos![i].videoPath
                                      }),
                                      title: Text(
                                        data.videos![i].videoName!,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.green.shade50,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Text(
                                'View PDF',
                                textScaleFactor: 2,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.black87,
                                child: ListTile(
                                  title: Text(
                                    data.pdfs!.pdfName!,
                                    style: const TextStyle(color: Colors.white),
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
