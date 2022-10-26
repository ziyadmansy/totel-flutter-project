import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/generated/json/base/json_field.dart';
import 'dart:convert';

class PostsEntity {
  final List<PostEntity> data;
  final int total;
  final int page;
  final int lastPage;

//<editor-fold desc="Data Methods">

  const PostsEntity({
    required this.data,
    required this.total,
    required this.page,
    required this.lastPage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostsEntity &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          total == other.total &&
          page == other.page &&
          lastPage == other.lastPage);

  @override
  int get hashCode =>
      data.hashCode ^ total.hashCode ^ page.hashCode ^ lastPage.hashCode;

  @override
  String toString() {
    return 'PostsEntity{' +
        ' data: $data,' +
        ' total: $total,' +
        ' page: $page,' +
        ' lastPage: $lastPage,' +
        '}';
  }

  PostsEntity copyWith({
    List<PostEntity>? data,
    int? total,
    int? page,
    int? lastPage,
  }) {
    return PostsEntity(
      data: data ?? this.data,
      total: total ?? this.total,
      page: page ?? this.page,
      lastPage: lastPage ?? this.lastPage,
    );
  }

  factory PostsEntity.fromMap(Map<String, dynamic> map) {
    return PostsEntity(
      data: (map['data'] as List).map((e) => PostEntity.fromJson(e)).toList(),
      total: map['total'] as int,
      page: map['page'] as int,
      lastPage: map['lastPage'] as int,
    );
  }

//</editor-fold>
}
