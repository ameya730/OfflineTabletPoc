import 'package:app/models/subject_model.dart';
import 'package:get/get.dart';

class LearningResourceController extends GetxController {
  List<Chapters> chapterList = <Chapters>[].obs;
  RxString videoName = "".obs;
  RxString pdfName = "".obs;
  RxBool isPlayingVideo = false.obs;
  RxBool isPDFOpen = false.obs;
  RxString pdfPath = "".obs;
}
