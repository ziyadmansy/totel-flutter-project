class HotelPhotos {
  HotelPhotos({
    required this.id,
    required this.url,
  });

  int id;
  String url;

  factory HotelPhotos.fromJson(Map<String, dynamic> json) => HotelPhotos(
    id: json["id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
  };
}
