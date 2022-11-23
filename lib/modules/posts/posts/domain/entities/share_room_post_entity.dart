// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/category_entity.dart';

class ShareRoomPostEntity {
  final List<ShareRoomPost> posts;
  ShareRoomPostEntity({
    required this.posts,
  });

  ShareRoomPostEntity copyWith({
    List<ShareRoomPost>? posts,
  }) {
    return ShareRoomPostEntity(
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posts': posts.map((x) => x.toMap()).toList(),
    };
  }

  factory ShareRoomPostEntity.fromMap(Map<String, dynamic> map) {
    return ShareRoomPostEntity(
      posts: List<ShareRoomPost>.from(
        (map['posts'] as List).map<ShareRoomPost>(
          (x) => ShareRoomPost.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShareRoomPostEntity.fromJson(String source) =>
      ShareRoomPostEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShareRoomPostEntity(posts: $posts)';

  @override
  bool operator ==(covariant ShareRoomPostEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.posts, posts);
  }

  @override
  int get hashCode => posts.hashCode;
}

class ShareRoomPost {
  final int id;
  final String nameOfProperty;
  final String postingType;
  final String country;
  final String address;
  final String latitude;
  final String longitude;
  final String checkinTimeFrom;
  final String checkinTimeTo;
  final String roomSetup;
  final int noOfGuestsAllowed;
  final int noOfBathrooms;
  final String parking;
  final double pricePerGroupSize;
  final double chargePerNight;
  final bool isChargeHourly;
  final String message;
  final List<String> generalFacilities;
  final List<String> cookingCleaningFacilities;
  final List<String> entertainmentFacilities;
  final List<String> outsideView;
  final List<String> houseRules;
  final UserEntity user;
  final CategoryEntity category;

  ShareRoomPost({
    required this.id,
    required this.nameOfProperty,
    required this.postingType,
    required this.country,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.checkinTimeFrom,
    required this.checkinTimeTo,
    required this.roomSetup,
    required this.noOfGuestsAllowed,
    required this.noOfBathrooms,
    required this.parking,
    required this.pricePerGroupSize,
    required this.chargePerNight,
    required this.isChargeHourly,
    required this.message,
    required this.generalFacilities,
    required this.cookingCleaningFacilities,
    required this.entertainmentFacilities,
    required this.outsideView,
    required this.houseRules,
    required this.user,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameOfProperty': nameOfProperty,
      'postingType': postingType,
      'country': country,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'checkinTimeFrom': checkinTimeFrom,
      'checkinTimeTo': checkinTimeTo,
      'roomSetup': roomSetup,
      'noOfGuestsAllowed': noOfGuestsAllowed,
      'noOfBathrooms': noOfBathrooms,
      'parking': parking,
      'pricePerGroupSize': pricePerGroupSize,
      'chargePerNight': chargePerNight,
      'isChargeHourly': isChargeHourly,
      'message': message,
      'generalFacilities': generalFacilities,
      'cookingCleaningFacilities': cookingCleaningFacilities,
      'entertainmentFacilities': entertainmentFacilities,
      'outsideView': outsideView,
      'houseRules': houseRules,
      'user': user.toJson(),
      'category': category.toMap(),
    };
  }

  factory ShareRoomPost.fromMap(Map<String, dynamic> map) {
    return ShareRoomPost(
      id: map['id'],
      nameOfProperty: map['name_of_property'],
      postingType: map['postingType'],
      country: map['country'],
      address: map['address'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      checkinTimeFrom: map['checkin_time_from'],
      checkinTimeTo: map['checkin_time_to'],
      roomSetup: map['room_setup'],
      noOfGuestsAllowed: map['no_of_guests_allowed'],
      noOfBathrooms: map['no_of_bathrooms'],
      parking: map['parking'],
      pricePerGroupSize: double.parse(map['price_per_group_size'].toString()),
      chargePerNight: double.parse(map['charge_per_night'].toString()),
      isChargeHourly: map['is_charge_hourly'],
      message: map['message'],
      generalFacilities: List<String>.from((map['general_facilities'])),
      cookingCleaningFacilities:
          List<String>.from((map['cooking_cleaning_facilities'])),
      entertainmentFacilities:
          List<String>.from((map['entertainment_facilities'])),
      outsideView: List<String>.from((map['outside_view'])),
      houseRules: List<String>.from((map['house_rules'])),
      user: UserEntity.fromJson(map['user'] as Map<String, dynamic>),
      category: CategoryEntity.fromMap(map['category'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShareRoomPost.fromJson(String source) =>
      ShareRoomPost.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShareRoomPost(id: $id, nameOfProperty: $nameOfProperty, postingType: $postingType, country: $country, address: $address, latitude: $latitude, longitude: $longitude, checkinTimeFrom: $checkinTimeFrom, checkinTimeTo: $checkinTimeTo, roomSetup: $roomSetup, noOfGuestsAllowed: $noOfGuestsAllowed, noOfBathrooms: $noOfBathrooms, parking: $parking, pricePerGroupSize: $pricePerGroupSize, chargePerNight: $chargePerNight, isChargeHourly: $isChargeHourly, message: $message, generalFacilities: $generalFacilities, cookingCleaningFacilities: $cookingCleaningFacilities, entertainmentFacilities: $entertainmentFacilities, outsideView: $outsideView, houseRules: $houseRules, user: $user, category: $category)';
  }

  @override
  bool operator ==(covariant ShareRoomPost other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nameOfProperty == nameOfProperty &&
        other.postingType == postingType &&
        other.country == country &&
        other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.checkinTimeFrom == checkinTimeFrom &&
        other.checkinTimeTo == checkinTimeTo &&
        other.roomSetup == roomSetup &&
        other.noOfGuestsAllowed == noOfGuestsAllowed &&
        other.noOfBathrooms == noOfBathrooms &&
        other.parking == parking &&
        other.pricePerGroupSize == pricePerGroupSize &&
        other.chargePerNight == chargePerNight &&
        other.isChargeHourly == isChargeHourly &&
        other.message == message &&
        listEquals(other.generalFacilities, generalFacilities) &&
        listEquals(
            other.cookingCleaningFacilities, cookingCleaningFacilities) &&
        listEquals(other.entertainmentFacilities, entertainmentFacilities) &&
        listEquals(other.outsideView, outsideView) &&
        listEquals(other.houseRules, houseRules) &&
        other.user == user &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameOfProperty.hashCode ^
        postingType.hashCode ^
        country.hashCode ^
        address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        checkinTimeFrom.hashCode ^
        checkinTimeTo.hashCode ^
        roomSetup.hashCode ^
        noOfGuestsAllowed.hashCode ^
        noOfBathrooms.hashCode ^
        parking.hashCode ^
        pricePerGroupSize.hashCode ^
        chargePerNight.hashCode ^
        isChargeHourly.hashCode ^
        message.hashCode ^
        generalFacilities.hashCode ^
        cookingCleaningFacilities.hashCode ^
        entertainmentFacilities.hashCode ^
        outsideView.hashCode ^
        houseRules.hashCode ^
        user.hashCode ^
        category.hashCode;
  }
}
