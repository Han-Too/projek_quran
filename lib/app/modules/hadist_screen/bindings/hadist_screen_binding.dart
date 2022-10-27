import 'package:get/get.dart';

import '../controllers/hadist_screen_controller.dart';

class HadistScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HadistScreenController>(
      () => HadistScreenController(),
    );
  }
}
