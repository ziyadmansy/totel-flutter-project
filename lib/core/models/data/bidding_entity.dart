import 'dart:convert';

import 'package:cheffy/core/models/data/post_entity.dart';
import 'package:cheffy/core/models/response/profile_entity.dart';
import 'package:cheffy/generated/json/base/json_field.dart';
import 'package:cheffy/generated/json/bidding_entity.g.dart';

@JsonSerializable()
class BiddingEntity {
  late int id;
  late String amount;

  @JSONField(name: "date_from")
  late DateTime dateFrom;

  @JSONField(name: "date_to")
  late DateTime dateTo;

  @JSONField(name: "is_selected")
  late int isSelected;

  late PostEntity post;
  late ProfileEntity user;

  BiddingEntity();

  factory BiddingEntity.fromMap(Map<String, dynamic> json) =>
      $BiddingEntityFromMap(json);
  @override
  String toString() {
    return jsonEncode(this);
  }
}
