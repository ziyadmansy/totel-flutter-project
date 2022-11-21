import 'dart:convert';

import 'package:cheffy/modules/posts/posts/domain/entities/attachment_entity.dart';
import 'package:flutter/foundation.dart';

class HotelEntity {
  final int id;
  final String name;
  final String? description;
  final String imageUrl;
  final String? address;
  final double? rating;
  final double? minPrice;
  final double? maxPrice;
  final String? type;
  final bool isHourlyBasis;
  final int numberOfRooms;
  final bool isBooked;
  final double latitude;
  final double longitude;
  final List? childrenPolicy;
  final List? nearbyCities;
  final List? nearbyPlaces;
  final String? city;
  final int? cityId;
  final List<AttachmentEntity> attachments;

  HotelEntity({
    required this.id,
    required this.name,
    this.description,
    required this.imageUrl,
    this.address,
    this.rating,
    this.minPrice,
    this.maxPrice,
    this.type,
    required this.isHourlyBasis,
    required this.numberOfRooms,
    required this.isBooked,
    required this.latitude,
    required this.longitude,
    required this.childrenPolicy,
    required this.nearbyCities,
    required this.nearbyPlaces,
    required this.city,
    required this.cityId,
    required this.attachments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'address': address,
      'rating': rating,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'type': type,
      'isHourlyBasis': isHourlyBasis,
      'numberOfRooms': numberOfRooms,
      'isBooked': isBooked,
      'latitude': latitude,
      'longitude': longitude,
      'childrenPolicy': childrenPolicy,
      'nearbyCities': nearbyCities,
      'nearbyPlaces': nearbyPlaces,
      'city': city,
      'cityId': cityId,
      'attachments': attachments,
    };
  }

  factory HotelEntity.fromMap(Map<String, dynamic> map) {
    return HotelEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      imageUrl: map['image_url'],
      address: map['address'] != null ? map['address'] as String : null,
      rating:
          map['rating'] != null ? double.parse(map['rating'].toString()) : null,
      minPrice: map['min_price'] != null
          ? double.parse(map['min_price'].toString())
          : null,
      maxPrice: map['max_price'] != null
          ? double.parse(map['max_price'].toString())
          : null,
      type: map['type'] != null ? map['type'] as String : null,
      isHourlyBasis: map['is_hourly_basis'] as bool,
      numberOfRooms: map['number_of_rooms'] as int,
      isBooked: map['is_booked'] == 1,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      childrenPolicy: map['childrenPolicy'] == null
          ? null
          : List.from((map['childrenPolicy'] as List)),
      nearbyCities: map['nearbyCities'] == null
          ? null
          : List.from((map['nearbyCities'] as List)),
      nearbyPlaces: map['nearbyPlaces'] == null
          ? null
          : List.from((map['nearbyPlaces'] as List)),
      attachments: (map['hotel_photos'] as List)
          .map((att) => AttachmentEntity.fromMap(att))
          .toList(),
      city: map['city'],
      cityId: map['cityId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelEntity.fromJson(String source) =>
      HotelEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HotelEntity(id: $id, name: $name, description: $description, imageUrl: $imageUrl, address: $address, rating: $rating, minPrice: $minPrice, maxPrice: $maxPrice, type: $type, isHourlyBasis: $isHourlyBasis, numberOfRooms: $numberOfRooms, isBooked: $isBooked, latitude: $latitude, longitude: $longitude, childrenPolicy: $childrenPolicy, nearbyCities: $nearbyCities, nearbyPlaces: $nearbyPlaces, city: $city, cityId: $cityId)';
  }

  @override
  bool operator ==(covariant HotelEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.address == address &&
        other.rating == rating &&
        other.minPrice == minPrice &&
        other.maxPrice == maxPrice &&
        other.type == type &&
        other.isHourlyBasis == isHourlyBasis &&
        other.numberOfRooms == numberOfRooms &&
        other.isBooked == isBooked &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        listEquals(other.childrenPolicy, childrenPolicy) &&
        listEquals(other.nearbyCities, nearbyCities) &&
        listEquals(other.nearbyPlaces, nearbyPlaces) &&
        // listEquals(other.amenities, amenities) &&
        other.city == city &&
        other.cityId == cityId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        address.hashCode ^
        rating.hashCode ^
        minPrice.hashCode ^
        maxPrice.hashCode ^
        type.hashCode ^
        isHourlyBasis.hashCode ^
        numberOfRooms.hashCode ^
        isBooked.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        childrenPolicy.hashCode ^
        nearbyCities.hashCode ^
        nearbyPlaces.hashCode ^
        // amenities.hashCode ^
        city.hashCode ^
        cityId.hashCode;
  }
}
