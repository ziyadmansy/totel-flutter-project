import 'dart:convert';

import 'package:cheffy/modules/posts/posts/domain/entities/attachment_entity.dart';
import 'package:flutter/foundation.dart';

import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';

class PostsEntity {
  List<Post> posts;

  PostsEntity({
    required this.posts,
  });

  PostsEntity copyWith({
    List<Post>? posts,
  }) {
    return PostsEntity(
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posts': posts.map((x) => x.toMap()).toList(),
    };
  }

  factory PostsEntity.fromMap(Map<String, dynamic> map) {
    return PostsEntity(
      posts: List<Post>.from(
        (map['posts'] as List).map<Post>(
          (x) => Post.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsEntity.fromJson(String source) =>
      PostsEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostEntity(posts: $posts)';

  @override
  bool operator ==(covariant PostsEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.posts, posts);
  }

  @override
  int get hashCode => posts.hashCode;
}

class Post {
  final int id;
  final String postingType;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final double paymentAmountPerNight;
  final String messageToPartner;
  final String partnerGender;
  final bool isHourly;
  final List<AttachmentEntity> attachments;
  final String? createdAt;
  final String? updatedAt;
  final UserEntity user;
  final HotelEntity hotel;

  Post({
    required this.id,
    required this.postingType,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.paymentAmountPerNight,
    required this.messageToPartner,
    required this.partnerGender,
    required this.isHourly,
    required this.attachments,
    this.createdAt,
    this.updatedAt,
    required this.user,
    required this.hotel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'postingType': postingType,
      'location': location,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'paymentAmountPerNight': paymentAmountPerNight,
      'messageToPartner': messageToPartner,
      'partnerGender': partnerGender,
      'isHourly': isHourly,
      'attachments': attachments,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'user': user.toJson(),
      'hotel': hotel.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      postingType: map['postingType'] as String,
      location: map['location'] as String,
      startDate: DateTime.parse(map['startDate'] as String),
      endDate: DateTime.parse(map['endDate'] as String),
      paymentAmountPerNight:
          double.parse(map['paymentAmountPerNight'].toString()),
      messageToPartner: map['messageToPartner'] as String,
      partnerGender: map['partnerGender'] as String,
      isHourly: map['isHourly'] as bool,
      attachments: (map['attachments'] as List)
          .map((att) => AttachmentEntity.fromMap(att))
          .toList(),
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      user: UserEntity.fromJson(map['user'] as Map<String, dynamic>),
      hotel: HotelEntity.fromMap(map['hotel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, postingType: $postingType, location: $location, startDate: $startDate, endDate: $endDate, paymentAmountPerNight: $paymentAmountPerNight, messageToPartner: $messageToPartner, partnerGender: $partnerGender, isHourly: $isHourly, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, hotel: $hotel)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.postingType == postingType &&
        other.location == location &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.paymentAmountPerNight == paymentAmountPerNight &&
        other.messageToPartner == messageToPartner &&
        other.partnerGender == partnerGender &&
        other.isHourly == isHourly &&
        listEquals(other.attachments, attachments) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.user == user &&
        other.hotel == hotel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        postingType.hashCode ^
        location.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        paymentAmountPerNight.hashCode ^
        messageToPartner.hashCode ^
        partnerGender.hashCode ^
        isHourly.hashCode ^
        attachments.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        user.hashCode ^
        hotel.hashCode;
  }
}
