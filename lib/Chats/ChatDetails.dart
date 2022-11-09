import 'dart:io';

import 'package:cheffy/Data/chats.dart';
import 'package:cheffy/Models/ChatListModel.dart';
import 'package:cheffy/Models/MessageModel.dart';
import 'package:cheffy/Models/SenderModel.dart';
import 'package:cheffy/Utils/Utils.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatListModel chatListModel = ChatListModel(
      senderDetails: SenderDetailsModel(sendername: '', profilePhoto: ""),
      chats: []);
  ChatScreen({required this.chatListModel});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textFieldController = TextEditingController();
  bool isWriting = false;
  ScrollController _listScrollController = ScrollController();
  bool showEmojiPicker = false;
  FocusNode textFieldFocusNode = FocusNode();

  setWritingTo(bool val) {
    setState(() {
      isWriting = val;
    });
  }

  Radius messageRadius = Radius.circular(16);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 50),
                Hero(
                  tag: widget.chatListModel.senderDetails.sendername,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    backgroundImage: NetworkImage(
                      widget.chatListModel.senderDetails.profilePhoto,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(widget.chatListModel.senderDetails.sendername,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          centerTitle: false,
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: messageList(),
            ),
            chatControl(),
          ],
        ),
      ),
    );
  }

  Widget messageList() {
    return ListView.separated(
      separatorBuilder: (context, i) {
        if (i == 3 || i == 1)
          return Center(
              child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(i == 3 ? '11:40' : '13:30',
                style: TextStyle(fontSize: 10, color: Colors.grey)),
          ));

        return Container();
      },
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10),
      controller: _listScrollController,
      itemCount: widget.chatListModel.chats.length,
      reverse: true,
      itemBuilder: (context, index) {
        return index == widget.chatListModel.chats.length - 1
            ? Column(
                children: [
                  SizedBox(height: 50),
                  Text('08:30',
                      style: TextStyle(fontSize: 10, color: Colors.grey)),
                  chatMessageItem(widget.chatListModel
                      .chats[widget.chatListModel.chats.length - 1 - index]),
                ],
              )
            : chatMessageItem(widget.chatListModel
                .chats[widget.chatListModel.chats.length - 1 - index]);
      },
    );
  }

  //
  Widget chatMessageItem(MessageModel cm) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Container(
          child: Align(
        alignment:
            cm.senderId == '' ? Alignment.centerRight : Alignment.centerLeft,
        child: cm.senderId == '' ? senderLayout(cm) : receiverLayout(cm),
      )),
    );
  }

  //
  Widget senderLayout(MessageModel message) {
    return Container(
      // margin: EdgeInsets.only(top: 8),
      constraints: BoxConstraints(
        maxWidth: (MediaQuery.of(context).size.width * 0.55),
      ),
      decoration: BoxDecoration(
        gradient: UniversalVariables.fabGradient,
        borderRadius: BorderRadius.only(
          topLeft: messageRadius,
          topRight: messageRadius,
          bottomLeft: messageRadius,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          message.message,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget receiverLayout(MessageModel message) {
    return Container(
      // margin: EdgeInsets.only(top: 12),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.5,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          bottomRight: messageRadius,
          topRight: messageRadius,
          bottomLeft: messageRadius,
        ),
      ),
      child: message.type == 'text'
          ? Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                message.message,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ))
          : Container(
              constraints: BoxConstraints(
                maxHeight: 200,
                maxWidth: 200,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(message.message),
                ),
              ),
            ),
    );
  }

  Widget chatControl() {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          SizedBox(width: 5),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                suffixIcon: Icon(Icons.camera, color: Colors.grey),
                hintText: "Type a message",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              gradient: UniversalVariables.fabGradient,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.send, color: Colors.white),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
