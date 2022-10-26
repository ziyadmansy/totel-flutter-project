// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/enums/post_type.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/auth/otp/otp_view.dart';
import '../modules/auth/register/register_form_view.dart';
import '../modules/auth/register/register_phone_view.dart';
import '../modules/auth/register/register_view.dart';
import '../modules/chat_detail/chat_detail_view.dart';
import '../modules/location_change/location_change_view.dart';
import '../modules/location_change_map/location_change_map_view.dart';
import '../modules/main/chat/chat_view.dart';
import '../modules/main/home/home_view.dart';
import '../modules/main/main_view.dart';
import '../modules/main/map/map_view.dart';
import '../modules/main/post/post_view.dart';
import '../modules/on_boarding/on_boarding_view.dart';
import '../modules/payment/add_card/payment_add_cart_view.dart';
import '../modules/payment/options/payment_options_view.dart';
import '../modules/payment/summary/payment_summary_view.dart';
import '../modules/posts/create/create_post_view.dart';
import '../modules/posts/detail/post_detail_view.dart';
import '../modules/profile/edit/edit_profile_view.dart';
import '../modules/profile/profile_view.dart';
import '../modules/request/request_view.dart';
import '../modules/wallet/wallet_view.dart';

class Routes {
  static const String onBoardingView = '/';
  static const String loginView = '/login-view';
  static const String registerView = '/register-view';
  static const String oTPView = '/o-tp-view';
  static const String mainView = '/main-view';
  static const String chatDetailView = '/chat-detail-view';
  static const String createPostView = '/create-post-view';
  static const String locationChangeView = '/location-change-view';
  static const String locationChangeMapView = '/location-change-map-view';
  static const String postDetailView = '/post-detail-view';
  static const String profileView = '/profile-view';
  static const String editProfileView = '/edit-profile-view';
  static const String walletView = '/wallet-view';
  static const String paymentSummaryView = '/payment-summary-view';
  static const String paymentOptionsView = '/payment-options-view';
  static const String paymentAddCartView = '/payment-add-cart-view';
  static const String requestView = '/request-view';
  static const String mapView = '/map-view';
  static const all = <String>{
    onBoardingView,
    loginView,
    registerView,
    oTPView,
    mainView,
    chatDetailView,
    createPostView,
    locationChangeView,
    locationChangeMapView,
    postDetailView,
    profileView,
    editProfileView,
    walletView,
    paymentSummaryView,
    paymentOptionsView,
    paymentAddCartView,
    requestView,
    mapView
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.onBoardingView, page: OnBoardingView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(
      Routes.registerView,
      page: RegisterView,
      generator: RegisterViewRouter(),
    ),
    RouteDef(Routes.oTPView, page: OTPView),
    RouteDef(
      Routes.mainView,
      page: MainView,
      generator: MainViewRouter(),
    ),
    RouteDef(Routes.chatDetailView, page: ChatDetailView),
    RouteDef(Routes.createPostView, page: CreatePostView),
    RouteDef(Routes.locationChangeView, page: LocationChangeView),
    RouteDef(Routes.locationChangeMapView, page: LocationChangeMapView),
    RouteDef(Routes.postDetailView, page: PostDetailView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.editProfileView, page: EditProfileView),
    RouteDef(Routes.walletView, page: WalletView),
    RouteDef(Routes.paymentSummaryView, page: PaymentSummaryView),
    RouteDef(Routes.paymentOptionsView, page: PaymentOptionsView),
    RouteDef(Routes.paymentAddCartView, page: PaymentAddCartView),
    RouteDef(Routes.requestView, page: RequestView),
    RouteDef(Routes.mapView, page: MapPageView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    OnBoardingView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const OnBoardingView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RegisterView(),
        settings: data,
      );
    },
    OTPView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const OTPView(),
        settings: data,
      );
    },
    MainView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    ChatDetailView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const ChatDetailView(),
        settings: data,
      );
    },
    CreatePostView: (data) {
      var args = data.getArgs<CreatePostViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CreatePostView(
          key: args.key,
          type: args.type,
        ),
        settings: data,
      );
    },
    LocationChangeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const LocationChangeView(),
        settings: data,
      );
    },
    LocationChangeMapView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const LocationChangeMapView(),
        settings: data,
      );
    },
    PostDetailView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const PostDetailView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      var args = data.getArgs<ProfileViewArguments>(
        orElse: () => ProfileViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ProfileView(
          key: args.key,
          isMyProfile: args.isMyProfile,
        ),
        settings: data,
      );
    },
    EditProfileView: (data) {
      var args = data.getArgs<EditProfileViewArguments>(
        orElse: () => EditProfileViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => EditProfileView(key: args.key),
        settings: data,
      );
    },
    WalletView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const WalletView(),
        settings: data,
      );
    },
    PaymentSummaryView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const PaymentSummaryView(),
        settings: data,
      );
    },
    PaymentOptionsView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const PaymentOptionsView(),
        settings: data,
      );
    },
    PaymentAddCartView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const PaymentAddCartView(),
        settings: data,
      );
    },
    RequestView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RequestView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CreatePostView arguments holder class
class CreatePostViewArguments {
  final Key? key;
  final PostType type;
  CreatePostViewArguments({this.key, required this.type});
}

/// ProfileView arguments holder class
class ProfileViewArguments {
  final Key? key;
  final bool isMyProfile;
  ProfileViewArguments({this.key, this.isMyProfile = true});
}

/// EditProfileView arguments holder class
class EditProfileViewArguments {
  final Key? key;
  EditProfileViewArguments({this.key});
}

class RegisterViewRoutes {
  static const String registerPhoneView = '/';
  static const String registerFormView = '/register-form-view';
  static const all = <String>{
    registerPhoneView,
    registerFormView,
  };
}

class RegisterViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(RegisterViewRoutes.registerPhoneView, page: RegisterPhoneView),
    RouteDef(RegisterViewRoutes.registerFormView, page: RegisterFormView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    RegisterPhoneView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RegisterPhoneView(),
        settings: data,
      );
    },
    RegisterFormView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RegisterFormView(),
        settings: data,
      );
    },
  };
}

class MainViewRoutes {
  static const String homeView = '/';
  static const String mapView = '/map-view';
  static const String postView = '/post-view';
  static const String chatView = '/chat-view';
  static const all = <String>{
    homeView,
    mapView,
    postView,
    chatView,
  };
}

class MainViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(MainViewRoutes.homeView, page: HomePageView),
    RouteDef(MainViewRoutes.mapView, page: MapPageView),
    RouteDef(MainViewRoutes.postView, page: PostsPageView),
    RouteDef(MainViewRoutes.chatView, page: ChatPageView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomePageView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const HomePageView(),
        settings: data,
      );
    },
    MapPageView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const MapPageView(),
        settings: data,
      );
    },
    PostsPageView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const PostsPageView(),
        settings: data,
      );
    },
    ChatPageView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const ChatPageView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToOnBoardingView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.onBoardingView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.loginView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRegisterView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.registerView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToNestedRegisterPhoneView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      RegisterViewRoutes.registerPhoneView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToNestedRegisterFormView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      RegisterViewRoutes.registerFormView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOTPView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.oTPView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMainView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.mainView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToNestedHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      MainViewRoutes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToNestedMapView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      MainViewRoutes.mapView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMapView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      MainViewRoutes.mapView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToNestedPostView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      MainViewRoutes.postView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToNestedChatView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      MainViewRoutes.chatView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChatDetailView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.chatDetailView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCreatePostView({
    Key? key,
    required PostType type,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.createPostView,
      arguments: CreatePostViewArguments(key: key, type: type),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLocationChangeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.locationChangeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLocationChangeMapView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.locationChangeMapView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPostDetailView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.postDetailView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProfileView({
    Key? key,
    bool isMyProfile = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.profileView,
      arguments: ProfileViewArguments(key: key, isMyProfile: isMyProfile),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToEditProfileView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.editProfileView,
      arguments: EditProfileViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWalletView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.walletView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPaymentSummaryView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.paymentSummaryView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPaymentOptionsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.paymentOptionsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPaymentAddCartView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.paymentAddCartView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRequestView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo(
      Routes.requestView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}