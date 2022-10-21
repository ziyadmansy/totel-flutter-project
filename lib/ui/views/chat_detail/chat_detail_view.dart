import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/theme/styles.dart';

import 'chat_detail_view_model.dart';

class ChatDetailView extends ViewModelBuilderWidget<ChatDetailViewModel> {
  const ChatDetailView({super.key});

  @override
  Widget builder(
      BuildContext context, ChatDetailViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: viewModel.userImage,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              radius: 24,
            ),
            const SizedBox(width: 12),
            Text(
              viewModel.userName,
              style: AppStyle.of(context).b4M.wCChineseBlack,
            ),
          ],
        ),
      ),
      body: Chat(
        messages: viewModel.messages,
        onSendPressed: viewModel.handleSendPressed,
        user: viewModel.user,
        customBottomWidget: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -2),
                blurRadius: 4,
                color: Theme.of(context).colorScheme.shadow,
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: AppColors.soap),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: AppColors.soap),
                    ),
                    fillColor: AppColors.soap,
                    prefixIcon: IconButton(
                      onPressed: viewModel.onEmoji,
                      icon: Image(
                        image: R.svg.ic_emoji(width: 24, height: 24),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: viewModel.onImage,
                      icon: Image(
                        image: R.svg.ic_image(width: 24, height: 24),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              CircleAvatar(
                backgroundColor: AppColors.plumpPurplePrimary,
                radius: 24,
                child: IconButton(
                  onPressed: viewModel.onSubmit,
                  icon: Image(
                    image: R.svg.ic_send(width: 24, height: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: ListView(
      //       children: const [
      //         ChatDetailItemView(
      //           alignment: Alignment.centerLeft,
      //           message: 'Hey, hey, hey...\nIt\'s morning here in Tokyo 😊',
      //         ),
      //         SizedBox(height: 12),
      //         ChatDetailItemView(
      //           alignment: Alignment.centerRight,
      //           message: 'Send me some pictures',
      //         ),
      //         Padding(
      //           padding: EdgeInsets.symmetric(vertical: 16),
      //           child: Center(child: Text('11:40')),
      //         ),
      //         ChatDetailItemView(
      //           alignment: Alignment.centerLeft,
      //           message: 'Hey, hey, hey...\nIt\'s morning here in Tokyo 😊',
      //         ),
      //         SizedBox(height: 12),
      //         ChatDetailItemView(
      //           alignment: Alignment.centerRight,
      //           message: '😱😱😱😱😱 so beautiful',
      //         ),
      //         SizedBox(height: 12),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  @override
  ChatDetailViewModel viewModelBuilder(BuildContext context) =>
      ChatDetailViewModel();
}
