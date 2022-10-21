import 'dart:convert';

import 'package:cheffy/generated/json/base/json_field.dart';
import 'package:cheffy/generated/json/create_post_entity.g.dart';

@JsonSerializable()
class CreatePostEntity {
  late String name;
  String? overview;
  double rate = 0.0;
  late String type;
  String? notes;
  @JSONField(name: "partner_amount")
  double? partnerAmount;
  late String gender;
  List<int> attachments = [];
  late int location;

  CreatePostEntity();

  factory CreatePostEntity.fromJson(Map<String, dynamic> json) =>
      $CreatePostEntityFromJson(json);

  Map<String, dynamic> toJson() => $CreatePostEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
