import 'dart:convert';

class LocationEntity {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  LocationEntity({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  LocationEntity copyWith({
    int? id,
    String? name,
    double? latitude,
    double? longitude,
  }) {
    return LocationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LocationEntity.fromMap(Map<String, dynamic> map) {
    return LocationEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationEntity.fromJson(String source) => LocationEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocationEntity(id: $id, name: $name, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant LocationEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.latitude == latitude &&
      other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;
  }
}
