import 'package:cheffy/Models/ChatListModel.dart';

class AllChatsModel {
  AllChatsModel({
    required this.chatList,
  });

  List<ChatListModel> chatList;

  factory AllChatsModel.fromMap(Map<String, dynamic> json) => AllChatsModel(
        chatList: List<ChatListModel>.from(
            json["chatList"].map((x) => ChatListModel.fromMap(x))),
      );
}
