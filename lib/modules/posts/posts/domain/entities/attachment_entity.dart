import 'dart:convert';

import 'package:cheffy/app/app.dart';

class AttachmentEntity {
  final int id;
  final String url;

  AttachmentEntity({
    required this.id,
    required this.url,
  });

  AttachmentEntity copyWith({
    int? id,
    String? url,
  }) {
    return AttachmentEntity(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
    };
  }

  factory AttachmentEntity.fromMap(Map<String, dynamic> map) {
    return AttachmentEntity(
      id: map['id'] as int,
      url: map["url"],
    );
  }

  String toJson() => json.encode(toMap());

  factory AttachmentEntity.fromJson(String source) =>
      AttachmentEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UploadAttachmentEntity(id: $id, url: $url)';

  @override
  bool operator ==(covariant AttachmentEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}
