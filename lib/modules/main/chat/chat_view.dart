import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';

import 'chat_listing_item_view.dart';
import 'chat_view_model.dart';

class ChatPageView extends ViewModelBuilderWidget<ChatViewModel> {
  const ChatPageView({super.key});

  @override
  Widget builder(BuildContext context, ChatViewModel viewModel, Widget? child) {
    return ListView(
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
    );
  }

  @override
  ChatViewModel viewModelBuilder(BuildContext context) => ChatViewModel();
}
