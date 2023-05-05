import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';

//CountryController countryController = Get.find();

class CountryController extends GetxController {
  Country? selectedValue;
  Country? selectedValueCountry;

  String? countryData;
  List<Country> countryLists = [
    Country(name: '+62', flag: MyImgs.indonesiaIcon, countryName: "indonesia"),
    Country(name: '+52', flag: MyImgs.mexicoIcon, countryName: "mexico"),
    Country(name: '+92', flag: MyImgs.pakImg, countryName: "Pakistan"),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedValueCountry = countryLists.first;
  }
}

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  String? name;
  String? flag;
  String? countryName;
  Country({this.name, this.flag, this.countryName});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        flag: json["flag"],
        countryName: json["countryName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "flag": flag,
        "countryName": countryName,
      };
}
