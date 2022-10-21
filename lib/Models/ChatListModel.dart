import 'package:cheffy/Models/MessageModel.dart';
import 'package:cheffy/Models/SenderModel.dart';

class ChatListModel {
  ChatListModel({
    required this.senderDetails,
    required this.chats,
  });

  SenderDetailsModel senderDetails;
  List<MessageModel> chats;

  factory ChatListModel.fromMap(Map<String, dynamic> json) => ChatListModel(
        senderDetails: SenderDetailsModel.fromMap(json["senderDetails"]),
        chats: List<MessageModel>.from(
            json["chats"].map((x) => MessageModel.fromMap(x))),
      );
}
