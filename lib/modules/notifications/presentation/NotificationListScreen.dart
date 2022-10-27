import 'package:cheffy/Utils/images,dart.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/notifications/presentation/NotificationItem.dart';
import 'package:cheffy/modules/notifications/presentation/notifications_view_model.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsScreenView
    extends ViewModelBuilderWidget<NotificationsViewModel> {
  const NotificationsScreenView();

  @override
  NotificationsViewModel viewModelBuilder(BuildContext context) {
    return NotificationsViewModel(locator.get());
  }

  @override
  void onViewModelReady(NotificationsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getNotifications();
  }

  @override
  Widget builder(
      BuildContext context, NotificationsViewModel viewModel, Widget? child) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: SharedWidgets.buildAppBar(title: 'Notifications'),
        body: BackgroundProgress<NotificationsViewModel>(
          child: ListView.separated(
            itemCount: viewModel.notifications.length,
            itemBuilder: (context, i) {
              final notItem = viewModel.notifications[i];
              return NotificationItem(
                name: notItem.body,
                time: notItem.createdAt == null
                    ? ''
                    : timeago.format(notItem.createdAt!),
              );
            },
            separatorBuilder: (context, i) {
              return Divider();
            },
          ),
        ),
      ),
    );
  }
}
