// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CreateSharedRoomPostParams {
  final int categoryId;
  final String nameOfProperty;
  final String country;
  final String address;
  final double longitude;
  final double latitude;
  final String checkInFrom;
  final String checkInTo;
  final String roomSetup;
  final String parking;
  final String message;
  final int noOfAllowedGuests;
  final int noOfBathrooms;
  final List<String> generalFacilities;
  final List<String> cookingCleaningFacilities;
  final List<String> entertainmentFacilities;
  final List<String> outsideViewFacilities;
  final List<String> houseRulesFacilities;
  final double pricePerGroupSize;
  final double chargePerNight;
  final bool isChargeHourly;

  CreateSharedRoomPostParams({
    required this.categoryId,
    required this.nameOfProperty,
    required this.country,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.checkInFrom,
    required this.checkInTo,
    required this.roomSetup,
    required this.parking,
    required this.message,
    required this.noOfAllowedGuests,
    required this.noOfBathrooms,
    required this.generalFacilities,
    required this.cookingCleaningFacilities,
    required this.entertainmentFacilities,
    required this.outsideViewFacilities,
    required this.houseRulesFacilities,
    required this.pricePerGroupSize,
    required this.chargePerNight,
    required this.isChargeHourly,
  });

  CreateSharedRoomPostParams copyWith({
    int? categoryId,
    String? nameOfProperty,
    String? country,
    String? address,
    double? longitude,
    double? latitude,
    String? checkInFrom,
    String? checkInTo,
    String? roomSetup,
    String? parking,
    String? message,
    int? noOfAllowedGuests,
    int? noOfBathrooms,
    List<String>? generalFacilities,
    List<String>? cookingCleaningFacilities,
    List<String>? entertainmentFacilities,
    List<String>? outsideViewFacilities,
    List<String>? houseRulesFacilities,
    double? pricePerGroupSize,
    double? chargePerNight,
    bool? isChargeHourly,
  }) {
    return CreateSharedRoomPostParams(
      categoryId: categoryId ?? this.categoryId,
      nameOfProperty: nameOfProperty ?? this.nameOfProperty,
      country: country ?? this.country,
      address: address ?? this.address,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      checkInFrom: checkInFrom ?? this.checkInFrom,
      checkInTo: checkInTo ?? this.checkInTo,
      roomSetup: roomSetup ?? this.roomSetup,
      parking: parking ?? this.parking,
      message: message ?? this.message,
      noOfAllowedGuests: noOfAllowedGuests ?? this.noOfAllowedGuests,
      noOfBathrooms: noOfBathrooms ?? this.noOfBathrooms,
      generalFacilities: generalFacilities ?? this.generalFacilities,
      cookingCleaningFacilities:
          cookingCleaningFacilities ?? this.cookingCleaningFacilities,
      entertainmentFacilities:
          entertainmentFacilities ?? this.entertainmentFacilities,
      outsideViewFacilities:
          outsideViewFacilities ?? this.outsideViewFacilities,
      houseRulesFacilities: houseRulesFacilities ?? this.houseRulesFacilities,
      pricePerGroupSize: pricePerGroupSize ?? this.pricePerGroupSize,
      chargePerNight: chargePerNight ?? this.chargePerNight,
      isChargeHourly: isChargeHourly ?? this.isChargeHourly,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "category": categoryId,
      "name_of_property": nameOfProperty,
      "country": country,
      "address": address,
      "latitude": latitude,
      "longitude": longitude,
      "checkin_time_from": checkInFrom,
      "checkin_time_to": checkInTo,
      "room_setup": roomSetup,
      "no_of_guests_allowed": noOfAllowedGuests,
      "no_of_bathrooms": noOfBathrooms,
      "general_facilities": generalFacilities,
      "cooking_cleaning_facilities": cookingCleaningFacilities,
      "entertainment_facilities": entertainmentFacilities,
      "outside_view": outsideViewFacilities,
      "house_rules": houseRulesFacilities,
      "parking": parking,
      "price_per_group_size": pricePerGroupSize,
      "charge_per_night": chargePerNight,
      "is_charge_hourly": isChargeHourly,
      "message": message,
    };
  }

  factory CreateSharedRoomPostParams.fromMap(Map<String, dynamic> map) {
    return CreateSharedRoomPostParams(
      categoryId: map['categoryId'] as int,
      nameOfProperty: map['nameOfProperty'] as String,
      country: map['country'] as String,
      address: map['address'] as String,
      longitude: map['longitude'] as double,
      latitude: map['latitude'] as double,
      checkInFrom: map['checkInFrom'] as String,
      checkInTo: map['checkInTo'] as String,
      roomSetup: map['roomSetup'] as String,
      parking: map['parking'] as String,
      message: map['message'] as String,
      noOfAllowedGuests: map['noOfAllowedGuests'] as int,
      noOfBathrooms: map['noOfBathrooms'] as int,
      generalFacilities:
          List<String>.from((map['generalFacilities'] as List<String>)),
      cookingCleaningFacilities:
          List<String>.from((map['cookingCleaningFacilities'] as List<String>)),
      entertainmentFacilities:
          List<String>.from((map['entertainmentFacilities'] as List<String>)),
      outsideViewFacilities:
          List<String>.from((map['outsideViewFacilities'] as List<String>)),
      houseRulesFacilities:
          List<String>.from((map['houseRulesFacilities'] as List<String>)),
      pricePerGroupSize: map['pricePerGroupSize'] as double,
      chargePerNight: map['chargePerNight'] as double,
      isChargeHourly: map['isChargeHourly'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateSharedRoomPostParams.fromJson(String source) =>
      CreateSharedRoomPostParams.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateBookedPostParams(categoryId: $categoryId, nameOfProperty: $nameOfProperty, country: $country, address: $address, longitude: $longitude, latitude: $latitude, checkInFrom: $checkInFrom, checkInTo: $checkInTo, roomSetup: $roomSetup, parking: $parking, message: $message, noOfAllowedGuests: $noOfAllowedGuests, noOfBathrooms: $noOfBathrooms, generalFacilities: $generalFacilities, cookingCleaningFacilities: $cookingCleaningFacilities, entertainmentFacilities: $entertainmentFacilities, outsideViewFacilities: $outsideViewFacilities, houseRulesFacilities: $houseRulesFacilities, pricePerGroupSize: $pricePerGroupSize, chargePerNight: $chargePerNight, isChargeHourly: $isChargeHourly)';
  }

  @override
  bool operator ==(covariant CreateSharedRoomPostParams other) {
    if (identical(this, other)) return true;

    return other.categoryId == categoryId &&
        other.nameOfProperty == nameOfProperty &&
        other.country == country &&
        other.address == address &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.checkInFrom == checkInFrom &&
        other.checkInTo == checkInTo &&
        other.roomSetup == roomSetup &&
        other.parking == parking &&
        other.message == message &&
        other.noOfAllowedGuests == noOfAllowedGuests &&
        other.noOfBathrooms == noOfBathrooms &&
        listEquals(other.generalFacilities, generalFacilities) &&
        listEquals(
            other.cookingCleaningFacilities, cookingCleaningFacilities) &&
        listEquals(other.entertainmentFacilities, entertainmentFacilities) &&
        listEquals(other.outsideViewFacilities, outsideViewFacilities) &&
        listEquals(other.houseRulesFacilities, houseRulesFacilities) &&
        other.pricePerGroupSize == pricePerGroupSize &&
        other.chargePerNight == chargePerNight &&
        other.isChargeHourly == isChargeHourly;
  }

  @override
  int get hashCode {
    return categoryId.hashCode ^
        nameOfProperty.hashCode ^
        country.hashCode ^
        address.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        checkInFrom.hashCode ^
        checkInTo.hashCode ^
        roomSetup.hashCode ^
        parking.hashCode ^
        message.hashCode ^
        noOfAllowedGuests.hashCode ^
        noOfBathrooms.hashCode ^
        generalFacilities.hashCode ^
        cookingCleaningFacilities.hashCode ^
        entertainmentFacilities.hashCode ^
        outsideViewFacilities.hashCode ^
        houseRulesFacilities.hashCode ^
        pricePerGroupSize.hashCode ^
        chargePerNight.hashCode ^
        isChargeHourly.hashCode;
  }
}
