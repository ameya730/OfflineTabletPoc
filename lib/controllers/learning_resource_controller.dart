import 'package:get/get.dart';

class LearningResourceController extends GetxController {
  RxString videoName = "".obs;
  RxString pdfName = "".obs;
  RxBool isPlayingVideo = false.obs;
  RxBool isPDFOpen = false.obs;
  RxString pdfPath = "".obs;
}
