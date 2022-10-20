import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'app/constants/color.dart';
import 'app/routes/app_pages.dart';

void main(List<String> args) {
  runApp(
    GetMaterialApp(
      // theme: appLight,
      theme: appLight,
      title: "aplication",
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    )
  );
}