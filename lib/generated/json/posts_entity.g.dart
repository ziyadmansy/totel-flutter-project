import 'package:cheffy/generated/json/base/json_convert_content.dart';
import 'package:cheffy/core/models/response/posts_entity.dart';
import 'package:cheffy/core/models/data/post_entity.dart';

PostsEntity $PostsEntityFromJson(Map<String, dynamic> json) {
  final PostsEntity postsEntity = PostsEntity();
  final List<PostEntity>? data =
      jsonConvert.convertListNotNull<PostEntity>(json['data']);
  if (data != null) {
    postsEntity.data = data;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    postsEntity.total = total;
  }
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    postsEntity.page = page;
  }
  final int? lastPage = jsonConvert.convert<int>(json['last_page']);
  if (lastPage != null) {
    postsEntity.lastPage = lastPage;
  }
  return postsEntity;
}

Map<String, dynamic> $PostsEntityToJson(PostsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['page'] = entity.page;
  data['last_page'] = entity.lastPage;
  return data;
}
