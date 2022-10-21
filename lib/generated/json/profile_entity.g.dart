import 'package:cheffy/generated/json/base/json_convert_content.dart';
import 'package:cheffy/core/models/response/profile_entity.dart';

ProfileEntity $ProfileEntityFromJson(Map<String, dynamic> json) {
  final ProfileEntity profileEntity = ProfileEntity();
  final int? statusCode = jsonConvert.convert<int>(json['statusCode']);
  if (statusCode != null) {
    profileEntity.statusCode = statusCode;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    profileEntity.message = message;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    profileEntity.id = id;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    profileEntity.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    profileEntity.lastName = lastName;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    profileEntity.username = username;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    profileEntity.email = email;
  }
  final String? xNative = jsonConvert.convert<String>(json['native']);
  if (xNative != null) {
    profileEntity.xNative = xNative;
  }
  final String? bio = jsonConvert.convert<String>(json['bio']);
  if (bio != null) {
    profileEntity.bio = bio;
  }
  final String? occupation = jsonConvert.convert<String>(json['occupation']);
  if (occupation != null) {
    profileEntity.occupation = occupation;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    profileEntity.avatar = avatar;
  }
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    profileEntity.gender = gender;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    profileEntity.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    profileEntity.updatedAt = updatedAt;
  }
  return profileEntity;
}

Map<String, dynamic> $ProfileEntityToJson(ProfileEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['statusCode'] = entity.statusCode;
  data['message'] = entity.message;
  data['id'] = entity.id;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['username'] = entity.username;
  data['email'] = entity.email;
  data['native'] = entity.xNative;
  data['bio'] = entity.bio;
  data['occupation'] = entity.occupation;
  data['avatar'] = entity.avatar;
  data['gender'] = entity.gender;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}
