import 'package:app/other/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart';

class ViewPDFPage extends StatefulWidget {
  const ViewPDFPage({Key? key}) : super(key: key);

  @override
  State<ViewPDFPage> createState() => _ViewPDFPageState();
}

class _ViewPDFPageState extends State<ViewPDFPage> {
  Future getData() async {
    return await Get.arguments['pdfPath'];
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
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                ),
                backgroundColor: Colors.transparent,
                body: SfPdfViewer.asset(snapshot.data!.toString()),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
