// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AboutEntity {
  final String description;
  AboutEntity({
    required this.description,
  });

  AboutEntity copyWith({
    String? description,
  }) {
    return AboutEntity(
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
    };
  }

  factory AboutEntity.fromMap(Map<String, dynamic> map) {
    return AboutEntity(
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AboutEntity.fromJson(String source) => AboutEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AboutEntity(description: $description)';

  @override
  bool operator ==(covariant AboutEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.description == description;
  }

  @override
  int get hashCode => description.hashCode;
}
