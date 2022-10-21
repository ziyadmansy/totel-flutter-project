import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/theme/styles.dart';

import 'chat_detail_view_model.dart';

class ChatDetailItemView extends ViewModelWidget<ChatDetailViewModel> {
  final Alignment alignment;
  final String message;

  const ChatDetailItemView(
      {super.key, required this.alignment, required this.message});

  @override
  Widget build(BuildContext context, ChatDetailViewModel viewModel) {
    return Align(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          color: alignment == Alignment.centerRight
              ? AppColors.plumpPurplePrimary
              : AppColors.soap,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          message,
          style: alignment == Alignment.centerRight
              ? AppStyle.of(context).b4M.wCWhite
              : AppStyle.of(context).b4M.wCChineseBlack,
        ),
      ),
    );
  }
}
