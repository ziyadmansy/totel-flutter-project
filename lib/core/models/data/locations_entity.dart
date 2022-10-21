import 'package:cheffy/generated/json/base/json_field.dart';
import 'package:cheffy/generated/json/locations_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LocationEntity {

	late int id;
	late String name;
	late double latitude;
	late double longitude;
  
  LocationEntity();

  factory LocationEntity.fromJson(Map<String, dynamic> json) => $LocationEntityFromJson(json);

  Map<String, dynamic> toJson() => $LocationEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}