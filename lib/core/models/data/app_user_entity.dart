import 'dart:convert';

import 'package:cheffy/generated/json/base/json_field.dart';
import 'package:cheffy/generated/json/profile_entity.g.dart';

import '../../../generated/json/app_user_entity.g.dart';

@JsonSerializable()
class AppUserEntity {
  late int id;
  @JSONField(name: "first_name")
  late String firstName;
  @JSONField(name: "last_name")
  late String lastName;
  late String username;
  late String email;
  @JSONField(name: "native")
  late String xNative;
  late String bio;
  late String occupation;
  late String avatar;
  late String gender;
  @JSONField(name: "created_at")
  late String createdAt;
  @JSONField(name: "updated_at")
  late String updatedAt;

  AppUserEntity();

  factory AppUserEntity.fromJson(Map<String, dynamic> json) =>
      $AppUserEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppUserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
