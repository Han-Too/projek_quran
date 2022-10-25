import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'app/constants/color.dart';
import 'app/routes/app_pages.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main(List<String> args) {
  HttpOverrides.global = MyHttpOverrides();
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

