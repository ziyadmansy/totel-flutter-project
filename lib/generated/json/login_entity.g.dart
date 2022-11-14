// import 'package:cheffy/generated/json/base/json_convert_content.dart';
// import 'package:cheffy/core/models/response/login_entity.dart';

// LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
//   final LoginEntity loginEntity = LoginEntity();
//   final String? accessToken = jsonConvert.convert<String>(json['access_token']);
//   if (accessToken != null) {
//     loginEntity.accessToken = accessToken;
//   }
//   final int? statusCode = jsonConvert.convert<int>(json['statusCode']);
//   if (statusCode != null) {
//     loginEntity.statusCode = statusCode;
//   }
//   final String? message = jsonConvert.convert<String>(json['message']);
//   if (message != null) {
//     loginEntity.message = message;
//   }
//   return loginEntity;
// }

// Map<String, dynamic> $LoginEntityToJson(LoginEntity entity) {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['access_token'] = entity.accessToken;
//   data['statusCode'] = entity.statusCode;
//   data['message'] = entity.message;
//   return data;
// }
// /*
// class Test{

//   final String name;

// //<editor-fold desc="Data Methods">

//   const Test({
//     required this.name,
//   });

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is Test && runtimeType == other.runtimeType && name == other.name);

//   @override
//   int get hashCode => name.hashCode;

//   @override
//   String toString() {
//     return 'Test{' + ' name: $name,' + '}';
//   }

//   Test copyWith({
//     String? name,
//   }) {
//     return Test(
//       name: name ?? this.name,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': this.name,
//     };
//   }

//   factory Test.fromMap(Map<String, dynamic> map) {
//     return Test(
//       name: map['name'] as String,
//     );
//   }

// //</editor-fold>
// }*/
