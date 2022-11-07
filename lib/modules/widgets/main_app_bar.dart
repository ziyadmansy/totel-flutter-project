// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:stacked/stacked.dart';
// import 'package:cheffy/core/services/authentication_service.dart';
// import 'package:cheffy/r.g.dart';

// import '../theme/color.dart';
// import '../main/main_view_model.dart';
// import 'app_bar_location_picker.dart';

// class MainAppBar extends ViewModelWidget<MainViewModel> {
//   const MainAppBar({super.key});

//   @override
//   Widget build(BuildContext context, MainViewModel viewModel) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
//       child: AppBarLocationPicker(
//         appUser: viewModel.appUser,
//         location: viewModel.location,
//         onTapViewProfile: viewModel.onTapViewProfile,
//         onTapChangeLocation: viewModel.onTapChangeLocation,
//         onNotificationPressed: viewModel.onPressedNotifications,
//       ),
//     );
//   }
// }
