import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController search = TextEditingController();
  var uuid = Uuid();
  String sessionToken = '122344';
  List<dynamic> placesList = [];
  void onChange() {
    if (sessionToken == null) {
      sessionToken = uuid.v4();
      update();
    }
    getSuggestion(search.text);
  }

  void getSuggestion(String input) async {
    String apiKey = "AIzaSyDHas1O4sXNw9ZvVupH2r3Kvzsr0DKIAP0";
    String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String dekat =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
    String request =
        "$baseUrl?input=$input&key=$apiKey&sessiontoken=$sessionToken";

    var respons = await http.get(Uri.parse(request));

    print(placesList);

    if (respons.statusCode == 200) {
      placesList = json.decode(respons.body)['predictions'];

      update();
    } else {
      throw Exception('Gagal');
    }
  }

  @override
  void onInit() {
    super.onInit();
    search.addListener(() {
      onChange();
    });
  }
}
