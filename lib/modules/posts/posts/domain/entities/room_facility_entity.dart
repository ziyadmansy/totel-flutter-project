// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RoomFacilityEntity {
  final String name;
  bool isChecked;

  RoomFacilityEntity({
    required this.name,
    required this.isChecked,
  });

  void switchCheck(bool? value) {
    if (value != null) {
      isChecked = value;
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'isChecked': isChecked,
    };
  }

  factory RoomFacilityEntity.fromMap(Map<String, dynamic> map) {
    return RoomFacilityEntity(
      name: map['name'] as String,
      isChecked: map['isChecked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomFacilityEntity.fromJson(String source) =>
      RoomFacilityEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RoomFacilityEntity(name: $name, isChecked: $isChecked)';

  @override
  bool operator ==(covariant RoomFacilityEntity other) {
    if (identical(this, other)) return true;

    return other.name == name && other.isChecked == isChecked;
  }

  @override
  int get hashCode => name.hashCode ^ isChecked.hashCode;
}
