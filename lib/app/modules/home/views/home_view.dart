import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:places_search/styles/app_color.dart';
import 'package:places_search/styles/app_typo.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          title: Text(
            'Google Search Places Api',
            style: AppTypo.heading1,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
              child: Column(
            children: [
              GetBuilder<HomeController>(builder: (context) {
                return SizedBox(
                    height: 42,
                    child: TextField(
                      controller: controller.search,
                      style: AppTypo.highlight2,
                      decoration: InputDecoration(
                          hintText: 'Cari rumahsakit...',
                          hintStyle: GoogleFonts.montserrat(
                              fontSize: 14, color: AppColor.disableColor),
                          filled: true,
                          fillColor: AppColor.bgColor,
                          prefixIcon: Icon(
                            IconlyLight.search,
                            size: 24,
                            color: AppColor.disableColor,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(6)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.disableColor, width: 1.3),
                              borderRadius: BorderRadius.circular(6)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.disableColor, width: 1.3),
                              borderRadius: BorderRadius.circular(6))),
                    ));
              }),
              SizedBox(height: 16),
              SizedBox(
                  child: Column(
                children: [
                  GetBuilder<HomeController>(builder: (context) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.placesList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.placesList[index]['description']}',
                                    style: AppTypo.highlight2,
                                  )
                                ],
                              ));
                        });
                  })
                ],
              ))
            ],
          )),
        ));
  }
}
