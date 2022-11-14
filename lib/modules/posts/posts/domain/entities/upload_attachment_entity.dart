// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UploadAttachmentEntity {
  final int id;
  final String url;
  UploadAttachmentEntity({
    required this.id,
    required this.url,
  });

  UploadAttachmentEntity copyWith({
    int? id,
    String? url,
  }) {
    return UploadAttachmentEntity(
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

  factory UploadAttachmentEntity.fromMap(Map<String, dynamic> map) {
    return UploadAttachmentEntity(
      id: map['id'] as int,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadAttachmentEntity.fromJson(String source) => UploadAttachmentEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UploadAttachmentEntity(id: $id, url: $url)';

  @override
  bool operator ==(covariant UploadAttachmentEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}
