import 'package:cheffy/generated/json/base/json_convert_content.dart';
import 'package:cheffy/core/models/request/create_post_entity.dart';

CreatePostEntity $CreatePostEntityFromJson(Map<String, dynamic> json) {
  final CreatePostEntity createPostEntity = CreatePostEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    createPostEntity.name = name;
  }
  final String? overview = jsonConvert.convert<String>(json['overview']);
  if (overview != null) {
    createPostEntity.overview = overview;
  }
  final double? rate = jsonConvert.convert<double>(json['rate']);
  if (rate != null) {
    createPostEntity.rate = rate;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    createPostEntity.type = type;
  }
  final String? notes = jsonConvert.convert<String>(json['notes']);
  if (notes != null) {
    createPostEntity.notes = notes;
  }
  final double? partnerAmount =
      jsonConvert.convert<double>(json['partner_amount']);
  if (partnerAmount != null) {
    createPostEntity.partnerAmount = partnerAmount;
  }
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    createPostEntity.gender = gender;
  }
  final List<int>? attachments =
      jsonConvert.convertListNotNull<int>(json['attachments']);
  if (attachments != null) {
    createPostEntity.attachments = attachments;
  }
  final int? location = jsonConvert.convert<int>(json['location']);
  if (location != null) {
    createPostEntity.location = location;
  }
  return createPostEntity;
}

Map<String, dynamic> $CreatePostEntityToJson(CreatePostEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['overview'] = entity.overview;
  data['rate'] = entity.rate;
  data['type'] = entity.type;
  data['notes'] = entity.notes;
  data['partner_amount'] = entity.partnerAmount;
  data['gender'] = entity.gender;
  data['attachments'] = entity.attachments;
  data['location'] = entity.location;
  return data;
}
