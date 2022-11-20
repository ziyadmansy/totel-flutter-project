import 'package:cheffy/core/enums/post_type.dart';
import 'package:dio/dio.dart';
import 'package:reactive_image_picker/reactive_image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

class CreateFindingPostParams {
  final DateTime startDate;
  final DateTime endDate;
  final double paymentAmountPerNight;
  final String partnerGender;
  final String partnerMessage;
  final num partnerAmount;
  final String location;
  final PostType postType;
  final bool isHourly;
  final List<XFile> attachments;
  final int hotelId;

  CreateFindingPostParams({
    required this.startDate,
    required this.endDate,
    required this.paymentAmountPerNight,
    required this.partnerGender,
    required this.partnerMessage,
    required this.partnerAmount,
    required this.location,
    required this.postType,
    required this.isHourly,
    required this.attachments,
    required this.hotelId,
  });

  Map<String, dynamic> toMap() {
    return {
      'hotel': hotelId,
      'postingType':
          postType == PostType.finding ? 'Finding Partner' : 'Already Booked',
      'location': location,
      'startDate': startDate.toUtc().toIso8601String(),
      'endDate': endDate.toUtc().toIso8601String(),
      'paymentAmountPerNight': paymentAmountPerNight,
      'messageToPartner': partnerMessage,
      'partnerGender': partnerGender,
      'isHourly': isHourly,
      'attachments': attachments
          .map(
            (att) async => await MultipartFile.fromFile(
              att.path,
              filename: basename(att.path),
            ),
          )
          .toList(),
    };
  }
}
