// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Occupation {
  final int id;
  final String name;
  Occupation({
    required this.id,
    required this.name,
  });

  Occupation copyWith({
    int? id,
    String? name,
  }) {
    return Occupation(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Occupation.fromMap(Map<String, dynamic> map) {
    return Occupation(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Occupation.fromJson(String source) => Occupation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Occupation(id: $id, name: $name)';

  @override
  bool operator ==(covariant Occupation other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
