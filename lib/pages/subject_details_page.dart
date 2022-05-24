import 'package:app/other/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectDetailsPage extends StatefulWidget {
  const SubjectDetailsPage({Key? key}) : super(key: key);

  @override
  State<SubjectDetailsPage> createState() => _SubjectDetailsPageState();
}

class _SubjectDetailsPageState extends State<SubjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: pageBackGround,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Text(Get.arguments['subjectName']),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
