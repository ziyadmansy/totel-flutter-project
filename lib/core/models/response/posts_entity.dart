import 'package:cheffy/core/models/data/post_entity.dart';
import 'package:cheffy/generated/json/base/json_field.dart';
import 'package:cheffy/generated/json/posts_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PostsEntity {
  late List<PostEntity> data;
  late int total;
  late int page;
  @JSONField(name: "last_page")
  late int lastPage;

  PostsEntity();

  factory PostsEntity.fromJson(Map<String, dynamic> json) =>
      $PostsEntityFromJson(json);

  Map<String, dynamic> toJson() => $PostsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
