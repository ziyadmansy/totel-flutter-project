// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HelpEntity {
  final int id;
  final String title;
  final String content;
  
  HelpEntity({
    required this.id,
    required this.title,
    required this.content,
  });

  HelpEntity copyWith({
    int? id,
    String? title,
    String? content,
  }) {
    return HelpEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
    };
  }

  factory HelpEntity.fromMap(Map<String, dynamic> map) {
    return HelpEntity(
      id: map['id'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HelpEntity.fromJson(String source) => HelpEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HelpEntity(id: $id, title: $title, content: $content)';

  @override
  bool operator ==(covariant HelpEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ content.hashCode;
}
