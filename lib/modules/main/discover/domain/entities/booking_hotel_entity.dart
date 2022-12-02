import 'dart:convert';

import 'package:cheffy/modules/main/discover/domain/entities/check_in_out_entity.dart';
import 'package:flutter/foundation.dart';

class BookingHotelEntity {
  final int hotelId;
  final String? id;
  final String? city;
  final int? ufi;
  final int? isMobileDeal;
  final int? isFreeCancellable;
  final int? soldout;
  final double? longitude;
  final double? geniusDiscountPercentage;
  final String? currencyCode;
  final int? priceIsFinal;
  final CheckInOutEntity checkin;
  final CheckInOutEntity checkout;
  final String? timezone;
  final int? cantBook;
  final String? reviewScoreWord;
  final double? mobileDiscountPercentage;
  final String? accommodationTypeName;
  final String? unitConfigurationLabel;
  final List<String>? blockIds;
  final int? accommodationType;
  final String? defaultLanguage;
  final int? preferred;
  final double? preferredPlus;
  final int? isNoPrepaymentBlock;
  final String? hotelName;
  final String? ribbonText;
  final int? childrenNotAllowed;
  final double? latitude;
  final String? mainPhotoUrl;
  final String? cityInTrans;
  final double? minTotalPrice;
  final int? mainPhotoId;
  final int? reviewNr;
  final String? hotelNameTrans;
  final int? isSmartDeal;
  final String? currencycode;
  final String? distanceToCcFormatted;
  final double? reviewScore;
  final String? defaultWishlistName;
  final int? hotelHasVbBoost;
  final int? isGeniusDeal;
  final String? countrycode;
  final int? hotelIncludeBreakfast;
  final int? hasSwimmingPool;
  final int? hasFreeParking;
  BookingHotelEntity({
    required this.hotelId,
    this.id,
    this.city,
    this.ufi,
    this.isMobileDeal,
    this.isFreeCancellable,
    this.soldout,
    this.longitude,
    this.geniusDiscountPercentage,
    this.currencyCode,
    this.priceIsFinal,
    required this.checkin,
    required this.checkout,
    this.timezone,
    this.cantBook,
    this.reviewScoreWord,
    this.mobileDiscountPercentage,
    this.accommodationTypeName,
    this.unitConfigurationLabel,
    this.blockIds,
    this.accommodationType,
    this.defaultLanguage,
    this.preferred,
    this.preferredPlus,
    this.isNoPrepaymentBlock,
    this.hotelName,
    this.ribbonText,
    this.childrenNotAllowed,
    this.latitude,
    this.mainPhotoUrl,
    this.cityInTrans,
    this.minTotalPrice,
    this.mainPhotoId,
    this.reviewNr,
    this.hotelNameTrans,
    this.isSmartDeal,
    this.currencycode,
    this.distanceToCcFormatted,
    this.reviewScore,
    this.defaultWishlistName,
    this.hotelHasVbBoost,
    this.isGeniusDeal,
    this.countrycode,
    this.hotelIncludeBreakfast,
    this.hasSwimmingPool,
    this.hasFreeParking,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'city': city,
      'ufi': ufi,
      'isMobileDeal': isMobileDeal,
      'isFreeCancellable': isFreeCancellable,
      'soldout': soldout,
      'longitude': longitude,
      'geniusDiscountPercentage': geniusDiscountPercentage,
      'currencyCode': currencyCode,
      'priceIsFinal': priceIsFinal,
      'checkout': checkout.toMap(),
      'timezone': timezone,
      'cantBook': cantBook,
      'reviewScoreWord': reviewScoreWord,
      'mobileDiscountPercentage': mobileDiscountPercentage,
      'accommodationTypeName': accommodationTypeName,
      'unitConfigurationLabel': unitConfigurationLabel,
      'blockIds': blockIds,
      'accommodationType': accommodationType,
      'defaultLanguage': defaultLanguage,
      'preferred': preferred,
      'preferredPlus': preferredPlus,
      'checkin': checkin.toMap(),
      'isNoPrepaymentBlock': isNoPrepaymentBlock,
      'hotelName': hotelName,
      'ribbonText': ribbonText,
      'childrenNotAllowed': childrenNotAllowed,
      'latitude': latitude,
      'mainPhotoUrl': mainPhotoUrl,
      'cityInTrans': cityInTrans,
      'minTotalPrice': minTotalPrice,
      'mainPhotoId': mainPhotoId,
      'reviewNr': reviewNr,
      'hotelId': hotelId,
      'hotelNameTrans': hotelNameTrans,
      'isSmartDeal': isSmartDeal,
      'currencycode': currencycode,
      'distanceToCcFormatted': distanceToCcFormatted,
      'reviewScore': reviewScore,
      'defaultWishlistName': defaultWishlistName,
      'hotelHasVbBoost': hotelHasVbBoost,
      'isGeniusDeal': isGeniusDeal,
      'countrycode': countrycode,
      'hotelIncludeBreakfast': hotelIncludeBreakfast,
      'hasSwimmingPool': hasSwimmingPool,
      'hasFreeParking': hasFreeParking,
    };
  }

  factory BookingHotelEntity.fromMap(Map<String, dynamic> map) {
    return BookingHotelEntity(
      mobileDiscountPercentage:
          double.tryParse(map['mobile_discount_percentage'].toString()),
      currencyCode: map['currency_code'],
      checkout: CheckInOutEntity.fromMap(map['checkout']),
      isSmartDeal: map['is_smart_deal'],
      longitude: map['longitude'],
      isMobileDeal: map['is_mobile_deal'],
      defaultWishlistName: map['default_wishlist_name'],
      blockIds: map['block_ids'].cast<String>(),
      minTotalPrice: double.tryParse(map['min_total_price'].toString()),
      unitConfigurationLabel: map['unit_configuration_label'],
      hotelNameTrans: map['hotel_name_trans'],
      ufi: map['ufi'],
      hasSwimmingPool: map['has_swimming_pool'],
      preferred: map['preferred'],
      currencycode: map['currencycode'],
      childrenNotAllowed: map['children_not_allowed'],
      reviewScore: double.tryParse(map['review_score'].toString()),
      hotelName: map['hotel_name'],
      defaultLanguage: map['default_language'],
      distanceToCcFormatted: map['distance_to_cc_formatted'],
      isNoPrepaymentBlock: map['is_no_prepayment_block'],
      latitude: map['latitude'],
      priceIsFinal: map['price_is_final'],
      countrycode: map['countrycode'],
      accommodationType: map['accommodation_type'],
      mainPhotoId: map['main_photo_id'],
      hotelId: map['hotel_id'],
      cantBook: map['cant_book'],
      reviewScoreWord: map['review_score_word'],
      isFreeCancellable: map['is_free_cancellable'],
      hotelIncludeBreakfast: map['hotel_include_breakfast'],
      mainPhotoUrl: map['main_photo_url'],
      cityInTrans: map['city_in_trans'],
      reviewNr: map['review_nr'],
      id: map['id'],
      preferredPlus: double.tryParse(map['preferred_plus'].toString()),
      accommodationTypeName: map['accommodation_type_name'],
      city: map['city'],
      checkin: CheckInOutEntity.fromMap(map['checkin']),
      timezone: map['timezone'],
      isGeniusDeal: map['is_genius_deal'],
      geniusDiscountPercentage:
          double.tryParse(map['genius_discount_percentage'].toString()),
      hotelHasVbBoost: map['hotel_has_vb_boost'],
      soldout: map['soldout'],
      ribbonText: map['ribbon_text'],
      hasFreeParking: map['has_free_parking'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingHotelEntity.fromJson(String source) =>
      BookingHotelEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HotelEntity(id: $id, city: $city, ufi: $ufi, isMobileDeal: $isMobileDeal, isFreeCancellable: $isFreeCancellable, soldout: $soldout, longitude: $longitude, geniusDiscountPercentage: $geniusDiscountPercentage, currencyCode: $currencyCode, priceIsFinal: $priceIsFinal, checkout: $checkout, timezone: $timezone, cantBook: $cantBook, reviewScoreWord: $reviewScoreWord, mobileDiscountPercentage: $mobileDiscountPercentage, accommodationTypeName: $accommodationTypeName, unitConfigurationLabel: $unitConfigurationLabel, blockIds: $blockIds, accommodationType: $accommodationType, defaultLanguage: $defaultLanguage, preferred: $preferred, preferredPlus: $preferredPlus, checkin: $checkin, isNoPrepaymentBlock: $isNoPrepaymentBlock, hotelName: $hotelName, ribbonText: $ribbonText, childrenNotAllowed: $childrenNotAllowed, latitude: $latitude, mainPhotoUrl: $mainPhotoUrl, cityInTrans: $cityInTrans, minTotalPrice: $minTotalPrice, mainPhotoId: $mainPhotoId, reviewNr: $reviewNr, hotelId: $hotelId, hotelNameTrans: $hotelNameTrans, isSmartDeal: $isSmartDeal, currencycode: $currencycode, distanceToCcFormatted: $distanceToCcFormatted, reviewScore: $reviewScore, defaultWishlistName: $defaultWishlistName, hotelHasVbBoost: $hotelHasVbBoost, isGeniusDeal: $isGeniusDeal, countrycode: $countrycode, hotelIncludeBreakfast: $hotelIncludeBreakfast, hasSwimmingPool: $hasSwimmingPool, hasFreeParking: $hasFreeParking)';
  }

  @override
  bool operator ==(covariant BookingHotelEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.city == city &&
        other.ufi == ufi &&
        other.isMobileDeal == isMobileDeal &&
        other.isFreeCancellable == isFreeCancellable &&
        other.soldout == soldout &&
        other.longitude == longitude &&
        other.geniusDiscountPercentage == geniusDiscountPercentage &&
        other.currencyCode == currencyCode &&
        other.priceIsFinal == priceIsFinal &&
        other.checkout == checkout &&
        other.timezone == timezone &&
        other.cantBook == cantBook &&
        other.reviewScoreWord == reviewScoreWord &&
        other.mobileDiscountPercentage == mobileDiscountPercentage &&
        other.accommodationTypeName == accommodationTypeName &&
        other.unitConfigurationLabel == unitConfigurationLabel &&
        listEquals(other.blockIds, blockIds) &&
        other.accommodationType == accommodationType &&
        other.defaultLanguage == defaultLanguage &&
        other.preferred == preferred &&
        other.preferredPlus == preferredPlus &&
        other.checkin == checkin &&
        other.isNoPrepaymentBlock == isNoPrepaymentBlock &&
        other.hotelName == hotelName &&
        other.ribbonText == ribbonText &&
        other.childrenNotAllowed == childrenNotAllowed &&
        other.latitude == latitude &&
        other.mainPhotoUrl == mainPhotoUrl &&
        other.cityInTrans == cityInTrans &&
        other.minTotalPrice == minTotalPrice &&
        other.mainPhotoId == mainPhotoId &&
        other.reviewNr == reviewNr &&
        other.hotelId == hotelId &&
        other.hotelNameTrans == hotelNameTrans &&
        other.isSmartDeal == isSmartDeal &&
        other.currencycode == currencycode &&
        other.distanceToCcFormatted == distanceToCcFormatted &&
        other.reviewScore == reviewScore &&
        other.defaultWishlistName == defaultWishlistName &&
        other.hotelHasVbBoost == hotelHasVbBoost &&
        other.isGeniusDeal == isGeniusDeal &&
        other.countrycode == countrycode &&
        other.hotelIncludeBreakfast == hotelIncludeBreakfast &&
        other.hasSwimmingPool == hasSwimmingPool &&
        other.hasFreeParking == hasFreeParking;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        city.hashCode ^
        ufi.hashCode ^
        isMobileDeal.hashCode ^
        isFreeCancellable.hashCode ^
        soldout.hashCode ^
        longitude.hashCode ^
        geniusDiscountPercentage.hashCode ^
        currencyCode.hashCode ^
        priceIsFinal.hashCode ^
        checkout.hashCode ^
        timezone.hashCode ^
        cantBook.hashCode ^
        reviewScoreWord.hashCode ^
        mobileDiscountPercentage.hashCode ^
        accommodationTypeName.hashCode ^
        unitConfigurationLabel.hashCode ^
        blockIds.hashCode ^
        accommodationType.hashCode ^
        defaultLanguage.hashCode ^
        preferred.hashCode ^
        preferredPlus.hashCode ^
        checkin.hashCode ^
        isNoPrepaymentBlock.hashCode ^
        hotelName.hashCode ^
        ribbonText.hashCode ^
        childrenNotAllowed.hashCode ^
        latitude.hashCode ^
        mainPhotoUrl.hashCode ^
        cityInTrans.hashCode ^
        minTotalPrice.hashCode ^
        mainPhotoId.hashCode ^
        reviewNr.hashCode ^
        hotelId.hashCode ^
        hotelNameTrans.hashCode ^
        isSmartDeal.hashCode ^
        currencycode.hashCode ^
        distanceToCcFormatted.hashCode ^
        reviewScore.hashCode ^
        defaultWishlistName.hashCode ^
        hotelHasVbBoost.hashCode ^
        isGeniusDeal.hashCode ^
        countrycode.hashCode ^
        hotelIncludeBreakfast.hashCode ^
        hasSwimmingPool.hashCode ^
        hasFreeParking.hashCode;
  }
}
