import 'dart:convert';

PostEntity postEntityFromJson(String str) =>
    PostEntity.fromJson(json.decode(str));

String postEntityToJson(PostEntity data) => json.encode(data.toJson());

class PostEntity {
  PostEntity({
    required this.id,
    required this.name,
    required this.overview,
    required this.caption,
    required this.rate,
    required this.notes,
    required this.partnerAmount,
    required this.gender,
    required this.latitude,
    required this.longitude,
    required this.dateFrom,
    required this.dateTo,
    required this.bidEnds,
    required this.isActive,
    required this.checkin,
    required this.checkout,
    required this.isAcceptHourly,
    required this.attachments,
    required this.user,
    required this.waitings,
    required this.biddings,
    required this.type,
    required this.hotel,
    required this.imgUrl,
    required this.price,
  });

  final int id;
  final String name;
  final String overview;
  final String caption;
  final int rate;
  final String notes;
  final String imgUrl;
  final int partnerAmount;
  final String gender;
  final int latitude;
  final int longitude;
  final DateTime dateFrom;
  final DateTime dateTo;
  final DateTime bidEnds;
  final bool isActive;
  final DateTime checkin;
  final DateTime checkout;
  final bool isAcceptHourly;
  final List<Attachment> attachments;
  final User user;
  final List<dynamic> waitings;
  final List<dynamic> biddings;
  final Type type;
  final Hotel hotel;
  final double price;

  factory PostEntity.fromJson(Map<String, dynamic> json) => PostEntity(
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        caption: json["caption"],
        rate: json["rate"],
        notes: json["notes"],
        partnerAmount: json["partner_amount"],
        gender: json["gender"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        dateFrom: DateTime.parse(json["date_from"]),
        dateTo: DateTime.parse(json["date_to"]),
        bidEnds: DateTime.parse(json["bid_ends"]),
        isActive: json["is_active"],
        checkin: DateTime.parse(json["checkin"]),
        checkout: DateTime.parse(json["checkout"]),
        isAcceptHourly: json["is_accept_hourly"],
        attachments: List<Attachment>.from(
            json["attachments"].map((x) => Attachment.fromJson(x))),
        user: User.fromJson(json["user"]),
        waitings: List<dynamic>.from(json["waitings"].map((x) => x)),
        biddings: List<dynamic>.from(json["biddings"].map((x) => x)),
        type: Type.fromJson(json["type"]),
        hotel: Hotel.fromJson(json["hotel"]),
        imgUrl: json["imgUrl"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "overview": overview,
        "caption": caption,
        "rate": rate,
        "notes": notes,
        "partner_amount": partnerAmount,
        "gender": gender,
        "latitude": latitude,
        "longitude": longitude,
        "date_from": dateFrom.toIso8601String(),
        "date_to": dateTo.toIso8601String(),
        "bid_ends": bidEnds.toIso8601String(),
        "is_active": isActive,
        "checkin": checkin.toIso8601String(),
        "checkout": checkout.toIso8601String(),
        "is_accept_hourly": isAcceptHourly,
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "user": user.toJson(),
        "waitings": List<dynamic>.from(waitings.map((x) => x)),
        "biddings": List<dynamic>.from(biddings.map((x) => x)),
        "type": type.toJson(),
        "hotel": hotel.toJson(),
        "imgUrl": imgUrl,
        "price": price,
      };
}

class Attachment {
  Attachment({
    required this.id,
    required this.url,
  });

  final int id;
  final String url;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}

class Hotel {
  Hotel({
    required this.id,
    required this.hotelId,
    required this.name,
    required this.rating,
    required this.price,
    required this.type,
    required this.isBooked,
    required this.latitude,
    required this.longitude,
  });

  final int id;
  final String hotelId;
  final String name;
  final int rating;
  final double price;
  final String type;
  final int isBooked;
  final int latitude;
  final int longitude;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        hotelId: json["hotelId"],
        name: json["name"],
        rating: json["rating"],
        price: json["price"].toDouble(),
        type: json["type"],
        isBooked: json["is_booked"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hotelId": hotelId,
        "name": name,
        "rating": rating,
        "price": price,
        "type": type,
        "is_booked": isBooked,
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Type {
  Type({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.native,
    required this.bio,
    required this.phoneNo,
    required this.dateOfBrith,
    required this.avatar,
    required this.city,
    required this.rating,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final dynamic native;
  final dynamic bio;
  final dynamic phoneNo;
  final dynamic dateOfBrith;
  final dynamic avatar;
  final dynamic city;
  final int rating;
  final dynamic gender;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        native: json["native"],
        bio: json["bio"],
        phoneNo: json["phone_no"],
        dateOfBrith: json["date_of_brith"],
        avatar: json["avatar"],
        city: json["city"],
        rating: json["rating"],
        gender: json["gender"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "password": password,
        "native": native,
        "bio": bio,
        "phone_no": phoneNo,
        "date_of_brith": dateOfBrith,
        "avatar": avatar,
        "city": city,
        "rating": rating,
        "gender": gender,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
