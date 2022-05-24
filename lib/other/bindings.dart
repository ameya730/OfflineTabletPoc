import 'package:app/controllers/learning_resource_controller.dart';
import 'package:app/controllers/home_controller.dart';
import 'package:app/controllers/view_video_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearningResourceController>(() => LearningResourceController());
  }
}

class ViewVideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewVideoController>(() => ViewVideoController());
  }
}
