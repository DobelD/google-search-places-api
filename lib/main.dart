import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:places_search/styles/app_color.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColor.primaryColor,
            ),
      ),
    ),
  );
}
