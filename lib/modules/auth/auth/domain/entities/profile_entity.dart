// To parse this JSON data, do
//
//     final profileEntity = profileEntityFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ProfileEntity {
  ProfileEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.native,
    required this.bio,
    required this.phoneNo,
    required this.dateOfBrith,
    required this.avatar,
    required this.city,
    required this.rating,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.hobbie,
    required this.occupation,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String? native;
  final String? bio;
  final String? phoneNo;
  final DateTime? dateOfBrith;
  final String? avatar;
  final String? city;
  final int rating;
  final String? gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? hobbie;
  final String? occupation;

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => ProfileEntity(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        native: json["native"],
        bio: json["bio"],
        phoneNo: json["phone_no"],
        dateOfBrith: json["date_of_brith"] ==null ? null :DateTime.tryParse(json["date_of_brith"]),
        avatar: json["avatar"],
        city: json["city"],
        rating: json["rating"],
        gender: json["gender"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        hobbie: json["hobbie"],
        occupation: json["occupation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "password": password,
        "native": native,
        "bio": bio,
        "phone_no": phoneNo,
        "date_of_brith": dateOfBrith?.toIso8601String(),
        "avatar": avatar,
        "city": city,
        "rating": rating,
        "gender": gender,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "hobbie": hobbie,
        "occupation": occupation,
      };
}
