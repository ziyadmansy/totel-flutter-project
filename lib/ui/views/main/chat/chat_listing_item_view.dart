import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/ui/theme/styles.dart';

import 'chat_view_model.dart';

class ChatListingItemView extends ViewModelWidget<ChatViewModel> {
  final ImageProvider userImage;
  final String userName;
  final String? lastMessage;

  const ChatListingItemView(
      {super.key,
      required this.userImage,
      required this.userName,
      this.lastMessage});

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    return InkWell(
      onTap: viewModel.onTapChat,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: userImage,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 24,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: AppStyle.of(context).b4M.wCChineseBlack,
                      ),
                      Text(
                        lastMessage ?? 'Hey, did you talk to her?',
                        style: AppStyle.of(context).b6.wCCrayola,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              '2 min ago',
              style: AppStyle.of(context).b6.wCCrayola,
            ),
          ],
        ),
      ),
    );
  }
}
