import 'package:cheffy/generated/json/base/json_convert_content.dart';
import 'package:cheffy/core/models/data/post_entity.dart';
import 'package:cheffy/core/models/data/app_user_entity.dart';

import 'package:cheffy/core/models/data/locations_entity.dart';


PostEntity $PostEntityFromJson(Map<String, dynamic> json) {
	final PostEntity postEntity = PostEntity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		postEntity.name = name;
	}
	final String? overview = jsonConvert.convert<String>(json['overview']);
	if (overview != null) {
		postEntity.overview = overview;
	}
	final int? rate = jsonConvert.convert<int>(json['rate']);
	if (rate != null) {
		postEntity.rate = rate;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		postEntity.type = type;
	}
	final String? notes = jsonConvert.convert<String>(json['notes']);
	if (notes != null) {
		postEntity.notes = notes;
	}
	final double? partnerAmount = jsonConvert.convert<double>(json['partner_amount']);
	if (partnerAmount != null) {
		postEntity.partnerAmount = partnerAmount;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		postEntity.gender = gender;
	}
	final List<int>? attachments = jsonConvert.convertListNotNull<int>(json['attachments']);
	if (attachments != null) {
		postEntity.attachments = attachments;
	}
	final AppUserEntity? user = jsonConvert.convert<AppUserEntity>(json['user']);
	if (user != null) {
		postEntity.user = user;
	}
	final LocationEntity? location = jsonConvert.convert<LocationEntity>(json['location']);
	if (location != null) {
		postEntity.location = location;
	}
	return postEntity;
}

Map<String, dynamic> $PostEntityToJson(PostEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['overview'] = entity.overview;
	data['rate'] = entity.rate;
	data['type'] = entity.type;
	data['notes'] = entity.notes;
	data['partner_amount'] = entity.partnerAmount;
	data['gender'] = entity.gender;
	data['attachments'] =  entity.attachments;
	data['user'] = entity.user.toJson();
	data['location'] = entity.location.toJson();
	return data;
}