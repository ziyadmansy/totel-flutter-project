// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:reactive_image_picker/reactive_image_picker.dart';

class CreateFindingPartnerPostParams {
  final int bookingId;
  final String messageToPartner;
  final String partnerGender;

  CreateFindingPartnerPostParams({
    required this.bookingId,
    required this.messageToPartner,
    required this.partnerGender,
  });

  CreateFindingPartnerPostParams copyWith({
    int? bookingId,
    String? messageToPartner,
    String? partnerGender,
  }) {
    return CreateFindingPartnerPostParams(
      bookingId: bookingId ?? this.bookingId,
      messageToPartner: messageToPartner ?? this.messageToPartner,
      partnerGender: partnerGender ?? this.partnerGender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'booking': bookingId,
      'messageToPartner': messageToPartner,
      'partnerGender': partnerGender,
    };
  }

  factory CreateFindingPartnerPostParams.fromMap(Map<String, dynamic> map) {
    return CreateFindingPartnerPostParams(
      bookingId: map['booking'] as int,
      messageToPartner: map['messageToPartner'] as String,
      partnerGender: map['partnerGender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateFindingPartnerPostParams.fromJson(String source) =>
      CreateFindingPartnerPostParams.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CreateFindingPartnerPostParams(bookingId: $bookingId, messageToPartner: $messageToPartner, partnerGender: $partnerGender)';

  @override
  bool operator ==(covariant CreateFindingPartnerPostParams other) {
    if (identical(this, other)) return true;

    return other.bookingId == bookingId &&
        other.messageToPartner == messageToPartner &&
        other.partnerGender == partnerGender;
  }

  @override
  int get hashCode =>
      bookingId.hashCode ^ messageToPartner.hashCode ^ partnerGender.hashCode;
}
