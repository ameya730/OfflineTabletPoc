import 'package:app/models/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<DashboardSummary> list = [
    DashboardSummary(
      subjectName: 'English',
      currentProgress: '70%',
      target: '100%',
      assignmentPending: 5,
    ),
    DashboardSummary(
      subjectName: 'Maths',
      currentProgress: '30%',
      target: '100%',
      assignmentPending: 2,
    ),
    DashboardSummary(
      subjectName: 'Science',
      currentProgress: '90%',
      target: '100%',
      assignmentPending: 1,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1B52CC),
        title: const Text('Your Learning Progress'),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xff1B52CC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/learningresource');
            },
            child: const Text(
              'Learning Resources',
              textScaleFactor: 2,
              style: TextStyle(color: Colors.black87),
            ),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.all(Colors.white70),
                padding: MaterialStateProperty.all(const EdgeInsets.all(16.0))),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  color: Colors.green.shade50,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        list[i].subjectName.toString(),
                        textScaleFactor: 4,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                const Text(
                                  'Learning Progress',
                                  textScaleFactor: 2,
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '${list[i].currentProgress}',
                                  textScaleFactor: 3,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                const Text(
                                  'Assignments Pending',
                                  textScaleFactor: 2,
                                  style: TextStyle(color: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 24.0),
                                  child: Text(
                                    '${list[i].assignmentPending}',
                                    textScaleFactor: 3,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
