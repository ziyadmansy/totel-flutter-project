// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cheffy/modules/main/discover/domain/entities/booking_location_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/check_details.dart';

class BookingHotelDetailsEntity {
  final String? reviewScore;
  final String? reviewScoreWord;
  final String? city;
  final int? preferred;
  final double? minrate;
  final String? currencycode;
  final int? classIsEstimated;
  final int? cityId;
  final int? isVacationRental;
  final int? districtId;
  final int? hoteltypeId;
  final CheckDetailsEntity? checkin;
  final CheckDetailsEntity? checkout;
  final int? reviewNr;
  final String? mainPhotoUrl;
  final String? country;
  final String? hotelFacilities;
  final String? url;
  final double? maxrate;
  final String? countrycode;
  final String? zip;
  final int? isSingleUnitVr;
  final int? hotelId;
  final int? mainPhotoId;
  final String? name;
  final BookingLocationEntity? location;
  final int? ranking;
  final int? preferredPlus;
  final String? entrancePhotoUrl;
  final String? hotelFacilitiesFiltered;
  final String? email;
  final String? address;

  BookingHotelDetailsEntity({
    this.reviewScore,
    this.reviewScoreWord,
    this.city,
    this.preferred,
    this.minrate,
    this.currencycode,
    this.classIsEstimated,
    this.cityId,
    this.isVacationRental,
    this.districtId,
    this.hoteltypeId,
    this.checkin,
    this.checkout,
    this.reviewNr,
    this.mainPhotoUrl,
    this.country,
    this.hotelFacilities,
    this.url,
    this.maxrate,
    this.countrycode,
    this.zip,
    this.isSingleUnitVr,
    this.hotelId,
    this.mainPhotoId,
    this.name,
    this.location,
    this.ranking,
    this.preferredPlus,
    this.entrancePhotoUrl,
    this.hotelFacilitiesFiltered,
    this.email,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reviewScore': reviewScore,
      'reviewScoreWord': reviewScoreWord,
      'city': city,
      'preferred': preferred,
      'minrate': minrate,
      'currencycode': currencycode,
      'classIsEstimated': classIsEstimated,
      'cityId': cityId,
      'isVacationRental': isVacationRental,
      'districtId': districtId,
      'hoteltypeId': hoteltypeId,
      'checkin': checkin?.toMap(),
      'checkout': checkout?.toMap(),
      'reviewNr': reviewNr,
      'mainPhotoUrl': mainPhotoUrl,
      'country': country,
      'hotelFacilities': hotelFacilities,
      'url': url,
      'maxrate': maxrate,
      'countrycode': countrycode,
      'zip': zip,
      'isSingleUnitVr': isSingleUnitVr,
      'hotelId': hotelId,
      'mainPhotoId': mainPhotoId,
      'name': name,
      'location': location?.toMap(),
      'ranking': ranking,
      'preferredPlus': preferredPlus,
      'entrancePhotoUrl': entrancePhotoUrl,
      'hotelFacilitiesFiltered': hotelFacilitiesFiltered,
      'email': email,
      'address': address,
    };
  }

  factory BookingHotelDetailsEntity.fromMap(Map<String, dynamic> map) {
    return BookingHotelDetailsEntity(
      reviewScore: map['review_score'],
      reviewScoreWord: map['review_score_word'],
      city: map['city'],
      preferred: map['preferred'],
      minrate: map['minrate'],
      currencycode: map['currencycode'],
      classIsEstimated: map['class_is_estimated'],
      cityId: map['city_id'],
      isVacationRental: map['is_vacation_rental'],
      districtId: map['district_id'],
      hoteltypeId: map['hoteltype_id'],
      checkout: map['checkout'] != null
          ? new CheckDetailsEntity.fromMap(map['checkout'])
          : null,
      reviewNr: map['review_nr'],
      mainPhotoUrl: map['main_photo_url'],
      country: map['country'],
      hotelFacilities: map['hotel_facilities'],
      url: map['url'],
      maxrate: map['maxrate'],
      countrycode: map['countrycode'],
      zip: map['zip'],
      isSingleUnitVr: map['is_single_unit_vr'],
      hotelId: map['hotel_id'],
      mainPhotoId: map['main_photo_id'],
      name: map['name'],
      location: map['location'] != null
          ? BookingLocationEntity.fromMap(map['location'])
          : null,
      ranking: map['ranking'],
      preferredPlus: map['preferred_plus'],
      entrancePhotoUrl: map['entrance_photo_url'],
      hotelFacilitiesFiltered: map['hotel_facilities_filtered'],
      email: map['email'],
      checkin: map['checkin'] != null
          ? CheckDetailsEntity.fromMap(map['checkin'])
          : null,
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingHotelDetailsEntity.fromJson(String source) =>
      BookingHotelDetailsEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingHotelDetailsEntity(reviewScore: $reviewScore, reviewScoreWord: $reviewScoreWord, city: $city, preferred: $preferred, minrate: $minrate, currencycode: $currencycode, classIsEstimated: $classIsEstimated, cityId: $cityId, isVacationRental: $isVacationRental, districtId: $districtId, hoteltypeId: $hoteltypeId, checkin: $checkin, checkout: $checkout, reviewNr: $reviewNr, mainPhotoUrl: $mainPhotoUrl, country: $country, hotelFacilities: $hotelFacilities, url: $url, maxrate: $maxrate, countrycode: $countrycode, zip: $zip, isSingleUnitVr: $isSingleUnitVr, hotelId: $hotelId, mainPhotoId: $mainPhotoId, name: $name, location: $location, ranking: $ranking, preferredPlus: $preferredPlus, entrancePhotoUrl: $entrancePhotoUrl, hotelFacilitiesFiltered: $hotelFacilitiesFiltered, email: $email, address: $address)';
  }

  @override
  bool operator ==(covariant BookingHotelDetailsEntity other) {
    if (identical(this, other)) return true;

    return other.reviewScore == reviewScore &&
        other.reviewScoreWord == reviewScoreWord &&
        other.city == city &&
        other.preferred == preferred &&
        other.minrate == minrate &&
        other.currencycode == currencycode &&
        other.classIsEstimated == classIsEstimated &&
        other.cityId == cityId &&
        other.isVacationRental == isVacationRental &&
        other.districtId == districtId &&
        other.hoteltypeId == hoteltypeId &&
        other.checkin == checkin &&
        other.checkout == checkout &&
        other.reviewNr == reviewNr &&
        other.mainPhotoUrl == mainPhotoUrl &&
        other.country == country &&
        other.hotelFacilities == hotelFacilities &&
        other.url == url &&
        other.maxrate == maxrate &&
        other.countrycode == countrycode &&
        other.zip == zip &&
        other.isSingleUnitVr == isSingleUnitVr &&
        other.hotelId == hotelId &&
        other.mainPhotoId == mainPhotoId &&
        other.name == name &&
        other.location == location &&
        other.ranking == ranking &&
        other.preferredPlus == preferredPlus &&
        other.entrancePhotoUrl == entrancePhotoUrl &&
        other.hotelFacilitiesFiltered == hotelFacilitiesFiltered &&
        other.email == email &&
        other.address == address;
  }

  @override
  int get hashCode {
    return reviewScore.hashCode ^
        reviewScoreWord.hashCode ^
        city.hashCode ^
        preferred.hashCode ^
        minrate.hashCode ^
        currencycode.hashCode ^
        classIsEstimated.hashCode ^
        cityId.hashCode ^
        isVacationRental.hashCode ^
        districtId.hashCode ^
        hoteltypeId.hashCode ^
        checkin.hashCode ^
        checkout.hashCode ^
        reviewNr.hashCode ^
        mainPhotoUrl.hashCode ^
        country.hashCode ^
        hotelFacilities.hashCode ^
        url.hashCode ^
        maxrate.hashCode ^
        countrycode.hashCode ^
        zip.hashCode ^
        isSingleUnitVr.hashCode ^
        hotelId.hashCode ^
        mainPhotoId.hashCode ^
        name.hashCode ^
        location.hashCode ^
        ranking.hashCode ^
        preferredPlus.hashCode ^
        entrancePhotoUrl.hashCode ^
        hotelFacilitiesFiltered.hashCode ^
        email.hashCode ^
        address.hashCode;
  }
}
