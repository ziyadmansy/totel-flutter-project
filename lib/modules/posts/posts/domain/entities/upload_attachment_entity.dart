import 'package:cheffy/generated/json/base/json_field.dart';
import 'package:cheffy/generated/json/upload_attachment_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UploadAttachmentEntity {
  late int id;
  late String url;

  UploadAttachmentEntity();

  factory UploadAttachmentEntity.fromJson(Map<String, dynamic> json) =>
      $UploadAttachmentEntityFromJson(json);

  Map<String, dynamic> toJson() => $UploadAttachmentEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
