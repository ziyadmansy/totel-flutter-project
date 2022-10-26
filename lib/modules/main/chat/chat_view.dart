import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';

import 'chat_listing_item_view.dart';
import 'chat_view_model.dart';

class ChatView extends ViewModelBuilderWidget<ChatViewModel> {
  const ChatView({super.key});

  @override
  Widget builder(BuildContext context, ChatViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: ListView(
        children: [
          ChatListingItemView(
            userName: 'Jane Cooper',
            userImage: R.image.img_avatar(),
          ),
          Divider(color: AppColors.soap, height: 1),
          ChatListingItemView(
            userName: 'Jane Cooper',
            userImage: R.image.img_avatar(),
          ),
          Divider(color: AppColors.soap, height: 1),
          ChatListingItemView(
            userName: 'Jane Cooper',
            userImage: R.image.img_avatar(),
          ),
          Divider(color: AppColors.soap, height: 1),
        ],
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(BuildContext context) => ChatViewModel();
}
