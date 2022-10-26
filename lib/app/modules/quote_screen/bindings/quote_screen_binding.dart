import 'package:get/get.dart';

import '../controllers/quote_screen_controller.dart';

class QuoteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuoteScreenController>(
      () => QuoteScreenController(),
    );
  }
}
