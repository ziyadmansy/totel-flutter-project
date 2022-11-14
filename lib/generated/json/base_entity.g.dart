// import 'package:cheffy/generated/json/base/json_convert_content.dart';
// import 'package:cheffy/core/models/response/base_entity.dart';

// BaseEntity $BaseEntityFromJson(Map<String, dynamic> json) {
//   final BaseEntity baseEntity = BaseEntity();
//   final int? statusCode = jsonConvert.convert<int>(json['statusCode']);
//   if (statusCode != null) {
//     baseEntity.statusCode = statusCode;
//   }
//   final String? message = jsonConvert.convert<String>(json['message']);
//   if (message != null) {
//     baseEntity.message = message;
//   }
//   return baseEntity;
// }

// Map<String, dynamic> $BaseEntityToJson(BaseEntity entity) {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['statusCode'] = entity.statusCode;
//   data['message'] = entity.message;
//   return data;
// }
