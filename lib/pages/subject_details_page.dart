import 'package:app/models/subject_model.dart';
import 'package:app/other/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectDetailsPage extends StatefulWidget {
  const SubjectDetailsPage({Key? key}) : super(key: key);

  @override
  State<SubjectDetailsPage> createState() => _SubjectDetailsPageState();
}

class _SubjectDetailsPageState extends State<SubjectDetailsPage> {
  late Subjects list;

  Future getData() async {
    if (Get.arguments['subjectDetails'] != null) {
      return await Get.arguments['subjectDetails'];
    }
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
              list = snapshot.data as Subjects;
              return SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    title: Text(
                      list.subjectName!,
                      textScaleFactor: 1.5,
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  body: GridView.builder(
                      shrinkWrap: true,
                      itemCount: list.chapters!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xff191970),
                                          Colors.white
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomLeft,
                                        stops: [0.00, 0.00])),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              list.chapters![index]
                                                  .chapterName!,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextButton.icon(
                                            label: const Text(
                                              'પસંદ કરો',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.toNamed(
                                                '/chapterDetails',
                                                arguments: {
                                                  "chapterDetails":
                                                      list.chapters![index]
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.forward,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}
