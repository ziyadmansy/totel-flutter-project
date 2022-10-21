import 'package:cheffy/Chats/ChatDetails.dart';
import 'package:cheffy/Data/chats.dart';
import 'package:cheffy/Models/AllChatsModel.dart';
import 'package:cheffy/Models/ChatListModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatefulWidget {
  @override
  _ChatsListState createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  AllChatsModel allChatsModel = AllChatsModel(chatList: []);
  List<ChatListModel> _chatListModel = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allChatsModel = AllChatsModel.fromMap(chatsData);
    _chatListModel = allChatsModel.chatList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: _chatListModel.length,
        itemBuilder: (context, index) {
          // chatsData
          ChatListModel chatListModel = _chatListModel[index];
          return ListTile(
            leading: Hero(
              tag: chatListModel.senderDetails.sendername,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
                backgroundImage: NetworkImage(
                  chatListModel.senderDetails.profilePhoto,
                ),
              ),
            ),
            title: Text(
              chatListModel.senderDetails.sendername,
              style: TextStyle(
                fontWeight: index != 2 ? FontWeight.w500 : FontWeight.bold,
              ),
            ),
            trailing: Text(
              '${index + 10}min ago',
              style: TextStyle(
                color: index != 2 ? Colors.grey : Colors.blue,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              chatListModel.chats[chatListModel.chats.length - 1].message,
              style: TextStyle(fontSize: 12),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => ChatScreen(
                            chatListModel: chatListModel,
                          )));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}
