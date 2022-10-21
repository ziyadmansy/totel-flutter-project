import 'package:cheffy/core/models/data/bidding_entity.dart';
import 'package:cheffy/core/models/response/profile_entity.dart';
import 'package:cheffy/generated/json/base/json_convert_content.dart';
import 'package:cheffy/core/models/data/post_entity.dart';

BiddingEntity $BiddingEntityFromMap(Map<String, dynamic> json) {
  final BiddingEntity biddingEntity = BiddingEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    biddingEntity.id = id;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    biddingEntity.amount = amount;
  }

  final DateTime? dateFrom = jsonConvert.convert<DateTime>(json['date_from']);
  if (dateFrom != null) {
    biddingEntity.dateFrom = dateFrom;
  }
  final DateTime? dateTo = jsonConvert.convert<DateTime>(json['date_to']);
  if (dateTo != null) {
    biddingEntity.dateTo = dateTo;
  }
  final int? isSelected = jsonConvert.convert<int>(json['is_selected']);
  if (isSelected != null) {
    biddingEntity.isSelected = isSelected;
  }

  final ProfileEntity? user = jsonConvert.convert<ProfileEntity>(json['user']);
  if (user != null) {
    biddingEntity.user = user;
  }

  final PostEntity? post = jsonConvert.convert<PostEntity>(json['post']);
  if (post != null) {
    biddingEntity.post = post;
  }
  return biddingEntity;
}

// Map<String, dynamic> $biddingEntityToJson(biddingEntity entity) {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['name'] = entity.name;
//   data['overview'] = entity.overview;
//   data['rate'] = entity.rate;
//   data['type'] = entity.type;
//   data['notes'] = entity.notes;
//   data['partner_amount'] = entity.partnerAmount;
//   data['gender'] = entity.gender;
//   data['attachments'] = entity.attachments;
//   data['user'] = entity.user.toJson();
//   data['location'] = entity.location.toJson();
//   return data;
// }
