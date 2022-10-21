import 'package:cheffy/generated/json/base/json_convert_content.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';

LocationEntity $LocationEntityFromJson(Map<String, dynamic> json) {
  final LocationEntity locationEntity = LocationEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    locationEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    locationEntity.name = name;
  }
  final double? latitude = jsonConvert.convert<double>(json['latitude']);
  if (latitude != null) {
    locationEntity.latitude = latitude;
  }
  final double? longitude = jsonConvert.convert<double>(json['longitude']);
  if (longitude != null) {
    locationEntity.longitude = longitude;
  }
  return locationEntity;
}

Map<String, dynamic> $LocationEntityToJson(LocationEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  return data;
}
