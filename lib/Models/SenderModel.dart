class SenderDetailsModel {
  SenderDetailsModel({
    required this.sendername,
    required this.profilePhoto,
  });

  String sendername;
  String profilePhoto;

  factory SenderDetailsModel.fromMap(Map<String, dynamic> json) =>
      SenderDetailsModel(
        sendername: json["sendername"],
        profilePhoto: json["profile_photo"],
      );
}
