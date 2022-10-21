import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:reactive_image_picker/image_file.dart';

class Utils {
  // ignore: constant_identifier_names
  static const TAG = 'Utils';

  static String? getProfileImageNameDecorator(String? name) {
    return name?.substring(0, 2);
  }

  static double getCubic(num width, num height, num length) {
    return (width * height * length).roundToDouble();
  }

  static num convertCubicInchesToCubicCentimeters(num cubInches) {
    return (cubInches * 16.387).roundToDouble();
  }

  static num convertCubicCentimetersToCubicInches(num cubCentimeters) {
    return (cubCentimeters / 16.387).roundToDouble();
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static String toBase64(File file) {
    return base64Encode(file.readAsBytesSync());
  }

  static String? getManufactureDate(String? when) {
    if (when != null && when.length == 3) {
      String weekNo = when.substring(0, 1);
      String monthLetter = when.substring(1, 2);
      String yearNo = when.substring(2);

      int year = 2020 + int.parse(yearNo);
      int week = int.parse(weekNo);
      int day = (week - 1) * 7;
      int month = 0;

      switch (monthLetter) {
        case "A":
          month = 1;
          if (day > 31) day = 31;
          break;
        case "B":
          month = 2;
          if (day > 28) day = 28;
          break;
        case "C":
          month = 3;
          if (day > 31) day = 31;
          break;
        case "D":
          month = 4;
          if (day > 30) day = 30;
          break;
        case "E":
          month = 5;
          if (day > 31) day = 31;
          break;
        case "F":
          month = 6;
          if (day > 30) day = 30;
          break;
        case "G":
          month = 7;
          if (day > 31) day = 31;
          break;
        case "H":
          month = 8;
          if (day > 31) day = 31;
          break;
        case "I":
          month = 9;
          if (day > 30) day = 30;
          break;
        case "J":
          month = 10;
          if (day > 31) day = 31;
          break;
        case "K":
          month = 11;
          if (day > 30) day = 30;
          break;
        case "L":
          month = 12;
          if (day > 31) day = 31;
          break;
      }

      int monthStartDayNo = DateTime(year, month, 1).weekday;
      day = day - (monthStartDayNo - 2);

      if (day < 1) {
        day = 1;
      }

      return DateTime(year, month, day).toYyyyMmDd('-', '-');
    }

    return null;
  }

  static Future<bool> hasNetworkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  static String? getBase64ImageString(ImageFile? imageFile) {
    if (imageFile?.image == null) {
      return null;
    }

    return toBase64(imageFile!.image!);
  }
}
