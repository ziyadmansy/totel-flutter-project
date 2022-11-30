import 'dart:convert';

class HotelLocationEntity {
  final int nrHotels;
  final String? cc1;
  final String? country;
  final double longitude;
  final double latitude;
  final String name;
  final String destId;
  final String destType;
  final String? timezone;
  final String label;
  final String? type;
  final int hotels;
  final String? region;
  final int rtl;
  final String? lc;
  final String? imageUrl;
  final String? cityName;

  HotelLocationEntity({
    required this.nrHotels,
    required this.cc1,
    required this.country,
    required this.longitude,
    required this.latitude,
    required this.name,
    required this.destId,
    required this.destType,
    required this.timezone,
    required this.label,
    required this.type,
    required this.hotels,
    required this.region,
    required this.rtl,
    required this.lc,
    required this.imageUrl,
    required this.cityName,
  });

  HotelLocationEntity copyWith({
    int? nrHotels,
    String? cc1,
    String? country,
    double? longitude,
    double? latitude,
    String? name,
    String? destId,
    String? destType,
    String? timezone,
    String? label,
    String? type,
    int? hotels,
    String? region,
    int? rtl,
    String? lc,
    String? imageUrl,
    String? cityName,
  }) {
    return HotelLocationEntity(
      nrHotels: nrHotels ?? this.nrHotels,
      cc1: cc1 ?? this.cc1,
      country: country ?? this.country,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      name: name ?? this.name,
      destId: destId ?? this.destId,
      destType: destType ?? this.destType,
      timezone: timezone ?? this.timezone,
      label: label ?? this.label,
      type: type ?? this.type,
      hotels: hotels ?? this.hotels,
      region: region ?? this.region,
      rtl: rtl ?? this.rtl,
      lc: lc ?? this.lc,
      imageUrl: imageUrl ?? this.imageUrl,
      cityName: cityName ?? this.cityName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nrHotels': nrHotels,
      'cc1': cc1,
      'country': country,
      'longitude': longitude,
      'latitude': latitude,
      'name': name,
      'destId': destId,
      'destType': destType,
      'timezone': timezone,
      'label': label,
      'type': type,
      'hotels': hotels,
      'region': region,
      'rtl': rtl,
      'lc': lc,
      'imageUrl': imageUrl,
      'cityName': cityName,
    };
  }

  factory HotelLocationEntity.fromMap(Map<String, dynamic> map) {
    return HotelLocationEntity(
      nrHotels: map['nr_hotels'],
      cc1: map['cc1'],
      country: map['country'],
      longitude: map['longitude'],
      latitude: map['latitude'],
      name: map['name'],
      destId: map['dest_id'],
      destType: map['dest_type'],
      timezone: map['timezone'],
      label: map['label'],
      type: map['type'],
      hotels: map['hotels'],
      region: map['region'],
      rtl: map['rtl'],
      lc: map['lc'],
      imageUrl: map['image_url'],
      cityName: map['city_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelLocationEntity.fromJson(String source) =>
      HotelLocationEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocationEntity(nrHotels: $nrHotels, cc1: $cc1, country: $country, longitude: $longitude, latitude: $latitude, name: $name, destId: $destId, destType: $destType, timezone: $timezone, label: $label, type: $type, hotels: $hotels, region: $region, rtl: $rtl, lc: $lc, imageUrl: $imageUrl, cityName: $cityName)';
  }

  @override
  bool operator ==(covariant HotelLocationEntity other) {
    if (identical(this, other)) return true;

    return other.nrHotels == nrHotels &&
        other.cc1 == cc1 &&
        other.country == country &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.name == name &&
        other.destId == destId &&
        other.destType == destType &&
        other.timezone == timezone &&
        other.label == label &&
        other.type == type &&
        other.hotels == hotels &&
        other.region == region &&
        other.rtl == rtl &&
        other.lc == lc &&
        other.imageUrl == imageUrl &&
        other.cityName == cityName;
  }

  @override
  int get hashCode {
    return nrHotels.hashCode ^
        cc1.hashCode ^
        country.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        name.hashCode ^
        destId.hashCode ^
        destType.hashCode ^
        timezone.hashCode ^
        label.hashCode ^
        type.hashCode ^
        hotels.hashCode ^
        region.hashCode ^
        rtl.hashCode ^
        lc.hashCode ^
        imageUrl.hashCode ^
        cityName.hashCode;
  }
}
