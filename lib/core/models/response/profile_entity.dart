import 'dart:convert';

import 'package:cheffy/generated/json/base/json_field.dart';
import 'package:cheffy/generated/json/profile_entity.g.dart';

@JsonSerializable()
class ProfileEntity {
  int? statusCode;
  String? message;
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

  ProfileEntity();

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      $ProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProfileEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
