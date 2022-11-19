// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';

class ReviewEntity {
  final int id;
  final String title;
  final String desc;
  final double rating;
  final DateTime datePosted;
  final UserEntity user;
  final HotelEntity hotel;

  ReviewEntity({
    required this.id,
    required this.title,
    required this.desc,
    required this.rating,
    required this.datePosted,
    required this.user,
    required this.hotel,
  });

  ReviewEntity copyWith({
    int? id,
    String? title,
    String? desc,
    double? rating,
    DateTime? datePosted,
    UserEntity? user,
    HotelEntity? hotel,
  }) {
    return ReviewEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      rating: rating ?? this.rating,
      datePosted: datePosted ?? this.datePosted,
      user: user ?? this.user,
      hotel: hotel ?? this.hotel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'desc': desc,
      'rating': rating,
      'datePosted': datePosted.millisecondsSinceEpoch,
      'user': user.toJson(),
      'hotel': hotel.toMap(),
    };
  }

  factory ReviewEntity.fromMap(Map<String, dynamic> map) {
    return ReviewEntity(
      id: map['id'] as int,
      title: map['title'] as String,
      desc: map['description'] as String,
      rating: double.parse(map['rating'].toString()),
      datePosted: DateTime.parse(map['date_posted']),
      user: UserEntity.fromJson(map['user'] as Map<String, dynamic>),
      hotel: HotelEntity.fromMap(map['hotel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewEntity.fromJson(String source) =>
      ReviewEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReviewEntity(id: $id, title: $title, desc: $desc, rating: $rating, datePosted: $datePosted, user: $user, hotel: $hotel)';
  }

  @override
  bool operator ==(covariant ReviewEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.desc == desc &&
        other.rating == rating &&
        other.datePosted == datePosted &&
        other.user == user &&
        other.hotel == hotel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        desc.hashCode ^
        rating.hashCode ^
        datePosted.hashCode ^
        user.hashCode ^
        hotel.hashCode;
  }
}
