// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/main/profile/profile/domain/entities/booking_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/attachment_entity.dart';

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
  final String messageToPartner;
  final String partnerGender;
  final String? createdAt;
  final String? updatedAt;
  final UserEntity user;
  final BookingEntity booking;

  Post({
    required this.id,
    required this.postingType,
    required this.messageToPartner,
    required this.partnerGender,
    this.createdAt,
    this.updatedAt,
    required this.user,
    required this.booking,
  });

  Post copyWith({
    int? id,
    String? postingType,
    String? messageToPartner,
    String? partnerGender,
    String? createdAt,
    String? updatedAt,
    UserEntity? user,
    HotelEntity? hotel,
    BookingEntity? booking,
  }) {
    return Post(
      id: id ?? this.id,
      postingType: postingType ?? this.postingType,
      messageToPartner: messageToPartner ?? this.messageToPartner,
      partnerGender: partnerGender ?? this.partnerGender,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
      booking: booking ?? this.booking,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'postingType': postingType,
      'messageToPartner': messageToPartner,
      'partnerGender': partnerGender,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'user': user.toJson(),
      'booking': booking.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      postingType: map['postingType'] as String,
      messageToPartner: map['messageToPartner'] as String,
      partnerGender: map['partnerGender'] as String,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      user: UserEntity.fromJson(map['user'] as Map<String,dynamic>),
      booking: BookingEntity.fromMap(map['booking'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, postingType: $postingType, messageToPartner: $messageToPartner, partnerGender: $partnerGender, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, booking: $booking)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.postingType == postingType &&
      other.messageToPartner == messageToPartner &&
      other.partnerGender == partnerGender &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.user == user &&
      other.booking == booking;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      postingType.hashCode ^
      messageToPartner.hashCode ^
      partnerGender.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      user.hashCode ^
      booking.hashCode;
  }
}
