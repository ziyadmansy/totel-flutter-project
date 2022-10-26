import 'dart:convert';
import 'dart:math';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';

class ChatDetailViewModel extends BaseViewModel {
  final userImage = R.image.img_avatar();
  final userName = 'Jane Cooper';

  List<types.Message> _messages = [];

  List<types.Message> get messages => _messages;

  set messages(List<types.Message> messages) {
    _messages = messages;
    notifyListeners();
  }

  get user => const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  void _addMessage(types.Message message) {
    _messages.insert(0, message);
    notifyListeners();
  }

  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: _randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  String _randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void onSubmit() {}

  void onEmoji() {}

  void onImage() {}
}
