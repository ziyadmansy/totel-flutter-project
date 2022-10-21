class MessageModel {
  MessageModel({
    required this.message,
    required this.senderId,
    required this.type,
  });

  String message;
  String senderId;
  String type;

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        message: json["message"],
        senderId: json["senderId"],
        type: json["type"],
      );
}
