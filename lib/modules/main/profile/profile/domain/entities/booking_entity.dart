// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';

class BookingEntity {
  final int id;
  final double amount;
  final String currency;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int? noOfRooms;
  final String roomType;
  final String paymentOption;
  final String bookingStatus;
  final UserEntity user;
  final HotelEntity hotel;

  BookingEntity({
    required this.id,
    required this.amount,
    required this.currency,
    required this.checkInDate,
    required this.checkOutDate,
    required this.noOfRooms,
    required this.roomType,
    required this.paymentOption,
    required this.bookingStatus,
    required this.user,
    required this.hotel,
  });

  BookingEntity copyWith({
    int? id,
    double? amount,
    String? currency,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    int? noOfRooms,
    String? roomType,
    String? paymentOption,
    String? bookingStatus,
    UserEntity? user,
    HotelEntity? hotel,
  }) {
    return BookingEntity(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      noOfRooms: noOfRooms ?? this.noOfRooms,
      roomType: roomType ?? this.roomType,
      paymentOption: paymentOption ?? this.paymentOption,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      user: user ?? this.user,
      hotel: hotel ?? this.hotel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'currency': currency,
      'checkInDate': checkInDate.millisecondsSinceEpoch,
      'checkOutDate': checkOutDate.millisecondsSinceEpoch,
      'noOfRooms': noOfRooms,
      'roomType': roomType,
      'paymentOption': paymentOption,
      'bookingStatus': bookingStatus,
      'user': user.toJson(),
      'hotel': hotel.toMap(),
    };
  }

  factory BookingEntity.fromMap(Map<String, dynamic> map) {
    return BookingEntity(
      id: map['id'] as int,
      amount: double.parse(map['amount'].toString()),
      currency: map['currency'] as String,
      checkInDate: DateTime.parse(map['check_in_date']),
      checkOutDate: DateTime.parse(map['check_out_date']),
      noOfRooms: map['no_of_rooms'],
      roomType: map['room_type'] as String,
      paymentOption: map['payment_option'] as String,
      bookingStatus: map['booking_status'] as String,
      user: UserEntity.fromJson(map['user'] as Map<String,dynamic>),
      hotel: HotelEntity.fromMap(map['hotel'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingEntity.fromJson(String source) => BookingEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingEntity(id: $id, amount: $amount, currency: $currency, checkInDate: $checkInDate, checkOutDate: $checkOutDate, noOfRooms: $noOfRooms, roomType: $roomType, paymentOption: $paymentOption, bookingStatus: $bookingStatus, user: $user, hotel: $hotel)';
  }

  @override
  bool operator ==(covariant BookingEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.amount == amount &&
      other.currency == currency &&
      other.checkInDate == checkInDate &&
      other.checkOutDate == checkOutDate &&
      other.noOfRooms == noOfRooms &&
      other.roomType == roomType &&
      other.paymentOption == paymentOption &&
      other.bookingStatus == bookingStatus &&
      other.user == user &&
      other.hotel == hotel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      amount.hashCode ^
      currency.hashCode ^
      checkInDate.hashCode ^
      checkOutDate.hashCode ^
      noOfRooms.hashCode ^
      roomType.hashCode ^
      paymentOption.hashCode ^
      bookingStatus.hashCode ^
      user.hashCode ^
      hotel.hashCode;
  }
}
