import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/profile/profile_provider.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';

import 'chat_listing_item_view.dart';
import 'chat_view_model.dart';

class ChatPageView extends ViewModelBuilderWidget<ChatViewModel> {
  const ChatPageView({super.key});

  @override
  Widget builder(BuildContext context, ChatViewModel viewModel, Widget? child) {
    final mainViewModel = context.watch<MainViewModel>();
    final profileProvider = context.watch<ProfileProvider>();
    return Scaffold(
      appBar: SharedWidgets.buildHomeAppBar(
        appUser: profileProvider.profileEntity,
        location: mainViewModel.location,
        onTapViewProfile: mainViewModel.onTapViewProfile,
        onTapChangeLocation: mainViewModel.onTapChangeLocation,
        onNotificationPressed: mainViewModel.onPressedNotifications,
        onSearchPressed: mainViewModel.onPressedSearch,
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
