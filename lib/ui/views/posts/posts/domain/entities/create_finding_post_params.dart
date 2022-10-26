import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final createPostEntity = createPostEntityFromJson(jsonString);

class CreateFindingPostParams {
  CreateFindingPostParams({
    required this.isAcceptHourly,
    required this.dateFrom,
    required this.dateTo,
    required this.gender,
    required this.notes,
    required this.partnerAmount,
    required this.location,
  });
  final String name = '----';
  final bool isAcceptHourly;
  final DateTime dateFrom;
  final DateTime dateTo;
  final String gender;
  final String? notes;
  final num partnerAmount;
  final String location;

  Map<String, dynamic> toJson() => {
        "name": name,
        "notes": notes,
        "partner_amount": partnerAmount,
        "gender": gender,
        "location": location,
        'date_from': dateFrom.toIso8601String(),
        'date_to': dateTo.toIso8601String(),
        'is_accept_hourly': isAcceptHourly,
        'type': 'finding',
      };

  CreateFindingPostParams copyWith(
      {String? name,
      String? overview,
      num? rate,
      String? type,
      String? notes,
      num? partnerAmount,
      String? gender,
      List<int>? attachments,
      String? location,
      DateTime? dateFrom,
      DateTime? dateTo,
      double? lat,
      double? long,
      String? hotel,
      DateTime? bidEnds,
      String? checkIn,
      String? checkout,
      bool? isAcceptHourly,
      DateTime? bidStart}) {
    return CreateFindingPostParams(
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo,
      notes: notes ?? this.notes,
      partnerAmount: partnerAmount ?? this.partnerAmount,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      isAcceptHourly: isAcceptHourly ?? this.isAcceptHourly,
    );
  }
// copy with

}
