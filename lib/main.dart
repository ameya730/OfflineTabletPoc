import 'package:app/other/bindings.dart';
import 'package:app/pages/chapter_details_page.dart';
import 'package:app/pages/learning_resource_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/subject_details_page.dart';
import 'package:app/pages/view_pdf_page.dart';
import 'package:app/pages/view_video_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(widget,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      theme: ThemeData(
        fontFamily: GoogleFonts.martel().fontFamily,
      ),
      initialRoute: '/',
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/learningresource',
          page: () => const LearningResource(),
          binding: DashBoardBinding(),
        ),
        GetPage(
          name: '/subjectDetails',
          page: () => const SubjectDetailsPage(),
        ),
        GetPage(
          name: '/chapterDetails',
          page: () => const ChapterDetailsPage(),
        ),
        GetPage(
          name: '/viewVideo',
          page: () => const ViewVideoPage(),
          binding: ViewVideoBinding(),
        ),
        GetPage(
          name: '/viewPDF',
          page: () => const ViewPDFPage(),
        ),
      ],
    );
  }
}
