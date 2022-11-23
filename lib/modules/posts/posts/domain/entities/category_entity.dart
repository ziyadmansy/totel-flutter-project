import 'dart:convert';

class CategoryEntity {
  final int id;
  final String name;
  CategoryEntity({
    required this.id,
    required this.name,
  });

  CategoryEntity copyWith({
    int? id,
    String? name,
  }) {
    return CategoryEntity(
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

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryEntity.fromJson(String source) => CategoryEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryEntity(id: $id, name: $name)';

  @override
  bool operator ==(covariant CategoryEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
