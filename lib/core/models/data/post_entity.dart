import 'dart:convert';

import 'package:cheffy/core/models/data/app_user_entity.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/generated/json/base/json_field.dart';
import 'package:cheffy/generated/json/post_entity.g.dart';

@JsonSerializable()
class PostEntity {
  late String name;
  String? overview;
  int rate = 0;
  late String type;
  String? notes;
  @JSONField(name: "partner_amount")
  double? partnerAmount;
  late String gender;
  List<int> attachments = [];
  late AppUserEntity user;
  late LocationEntity location;

  PostEntity();

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      $PostEntityFromJson(json);

  Map<String, dynamic> toJson() => $PostEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
