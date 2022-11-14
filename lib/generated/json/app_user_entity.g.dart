// import 'package:cheffy/generated/json/base/json_convert_content.dart';
// import 'package:cheffy/core/models/data/app_user_entity.dart';

// AppUserEntity $AppUserEntityFromJson(Map<String, dynamic> json) {
//   final AppUserEntity appUserEntity = AppUserEntity();
//   final int? id = jsonConvert.convert<int>(json['id']);
//   if (id != null) {
//     appUserEntity.id = id;
//   }
//   final String? firstName = jsonConvert.convert<String>(json['first_name']);
//   if (firstName != null) {
//     appUserEntity.firstName = firstName;
//   }
//   final String? lastName = jsonConvert.convert<String>(json['last_name']);
//   if (lastName != null) {
//     appUserEntity.lastName = lastName;
//   }
//   final String? username = jsonConvert.convert<String>(json['username']);
//   if (username != null) {
//     appUserEntity.username = username;
//   }
//   final String? email = jsonConvert.convert<String>(json['email']);
//   if (email != null) {
//     appUserEntity.email = email;
//   }
//   final String? xNative = jsonConvert.convert<String>(json['native']);
//   if (xNative != null) {
//     appUserEntity.xNative = xNative;
//   }
//   final String? bio = jsonConvert.convert<String>(json['bio']);
//   if (bio != null) {
//     appUserEntity.bio = bio;
//   }
//   final String? occupation = jsonConvert.convert<String>(json['occupation']);
//   if (occupation != null) {
//     appUserEntity.occupation = occupation;
//   }
//   final String? avatar = jsonConvert.convert<String>(json['avatar']);
//   if (avatar != null) {
//     appUserEntity.avatar = avatar;
//   }
//   final String? gender = jsonConvert.convert<String>(json['gender']);
//   if (gender != null) {
//     appUserEntity.gender = gender;
//   }
//   final String? createdAt = jsonConvert.convert<String>(json['created_at']);
//   if (createdAt != null) {
//     appUserEntity.createdAt = createdAt;
//   }
//   final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
//   if (updatedAt != null) {
//     appUserEntity.updatedAt = updatedAt;
//   }
//   return appUserEntity;
// }

// Map<String, dynamic> $AppUserEntityToJson(AppUserEntity entity) {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['id'] = entity.id;
//   data['first_name'] = entity.firstName;
//   data['last_name'] = entity.lastName;
//   data['username'] = entity.username;
//   data['email'] = entity.email;
//   data['native'] = entity.xNative;
//   data['bio'] = entity.bio;
//   data['occupation'] = entity.occupation;
//   data['avatar'] = entity.avatar;
//   data['gender'] = entity.gender;
//   data['created_at'] = entity.createdAt;
//   data['updated_at'] = entity.updatedAt;
//   return data;
// }
