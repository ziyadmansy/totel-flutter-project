import 'dart:convert';

class BookingLocationEntity {
  final double lon;
  final double lat;

  BookingLocationEntity({
    required this.lon,
    required this.lat,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lon': lon,
      'lat': lat,
    };
  }

  factory BookingLocationEntity.fromMap(Map<String, dynamic> map) {
    return BookingLocationEntity(
      lon: map['longitude'] as double,
      lat: map['latitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingLocationEntity.fromJson(String source) => BookingLocationEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BookingLocationEntity(lon: $lon, lat: $lat)';

  @override
  bool operator ==(covariant BookingLocationEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.lon == lon &&
      other.lat == lat;
  }

  @override
  int get hashCode => lon.hashCode ^ lat.hashCode;
}