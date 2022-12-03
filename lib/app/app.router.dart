// ignore_for_file:  sort_constructors_first
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:cheffy/modules/main/discover/domain/entities/booking_hotel_entity.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:cheffy/modules/about/presentation/about_screen_view.dart';
import 'package:cheffy/modules/about/presentation/policy_details_view.dart';
import 'package:cheffy/modules/about/presentation/terms_details_view.dart';
import 'package:cheffy/modules/app_drawer/presentation/help_view.dart';
import 'package:cheffy/modules/auth/reset_password/reset_password_view.dart';
import 'package:cheffy/modules/main/discover/presentation/hotel_details_page.dart';
import 'package:cheffy/modules/main/discover/presentation/hotels_location_selection_view.dart';
import 'package:cheffy/modules/main/discover/presentation/search_filter_page.dart';
import 'package:cheffy/modules/main/discover/presentation/search_hotels_page.dart';
import 'package:cheffy/modules/main/discover/presentation/search_main_page.dart';
import 'package:cheffy/modules/main/profile/booking_screen.dart';
import 'package:cheffy/modules/notifications/presentation/NotificationListScreen.dart';
import 'package:cheffy/modules/payment/presentation/options/payment_percentage_view.dart';
import 'package:cheffy/modules/posts/create/create_post_finding_partner_view.dart';
import 'package:cheffy/modules/posts/detail/post_finding_partner_details_view.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/share_room_post_entity.dart';
import 'package:cheffy/modules/settings/presentation/SettingsMain.dart';
import 'package:cheffy/modules/splash/presentation/splash_view.dart';

import '../modules/auth/login/login_view.dart';
import '../modules/auth/otp/otp_view.dart';
import '../modules/auth/register/register_form_view.dart';
import '../modules/auth/register/register_phone_view.dart';
import '../modules/auth/register/register_view.dart';
import '../modules/chat_detail/chat_detail_view.dart';
import '../modules/location_change/location_change_view.dart';
import '../modules/location_change_map/location_change_map_view.dart';
import '../modules/main/chat/chat_view.dart';
import '../modules/main/main_view.dart';
import '../modules/main/map/map_view.dart';
import '../modules/main/profile/edit/edit_profile_view.dart';
import '../modules/main/profile/profile_view.dart';
import '../modules/on_boarding/on_boarding_view.dart';
import '../modules/payment/presentation/add_card/payment_add_cart_view.dart';
import '../modules/payment/presentation/options/payment_options_view.dart';
import '../modules/payment/presentation/summary/payment_summary_view.dart';
import '../modules/posts/create/create_post_share_room_view.dart';
import '../modules/posts/detail/post_share_room_detail_view.dart';
import '../modules/posts/posts/presentation/post_view.dart';
import '../modules/request/request_view.dart';
import '../modules/wallet/wallet_view.dart';

class Routes {
  static const String splashView = '/';
  static const String onBoardingView = '/on-boarding-view';
  static const String loginView = '/login-view';
  static const String registerView = '/register-view';
  static const String searchView = '/search-view';
  static const String oTPView = '/o-tp-view';
  static const String mainView = '/main-view';
  static const String chatDetailView = '/chat-detail-view';
  static const String createPostShareRoomView = '/create-post-share-room-view';
  static const String createPostFindingPartnerView =
      '/create-post-finding-partner-view';
  static const String locationChangeView = '/location-change-view';
  static const String locationChangeMapView = '/location-change-map-view';
  static const String postDetailView = '/post-detail-view';
  static const String postFindingPartnerDetailView =
      '/post-finding-partner-detail-view';
  static const String profileView = '/profile-view';
  static const String editProfileView = '/edit-profile-view';
  static const String walletView = '/wallet-view';
  static const String paymentSummaryView = '/payment-summary-view';
  static const String paymentPercentageView = '/payment-percentage-view';
  static const String paymentOptionsView = '/payment-options-view';
  static const String paymentAddCartView = '/payment-add-cart-view';
  static const String requestView = '/request-view';
  // static const String mapView = '/map-view';
  static const String aboutView = '/about-view';
  static const String notificationsView = '/notifications-view';
  static const String settingsView = '/settings-view';
  static const String resetPasswordView = '/reset-password-view';
  static const String helpView = '/help-view';
  // static const String searchFilterView = '/search-filter-view';
  static const String searchHotelsView = '/search-hotels-view';
  static const String hotelsSelectionView = '/hotels-selection-view';
  static const String bookingsView = '/bookings-view';
  static const String hotelDetailsView = '/hotel_details-view';
  static const String privacyPolicyDetailsView = '/privacy_policy_details-view';
  static const String termsAndConditionsView =
      '/terms_and_conditions_details-view';
  static const all = <String>{
    splashView,
    onBoardingView,
    loginView,
    registerView,
    searchView,
    oTPView,
    mainView,
    chatDetailView,
    createPostShareRoomView,
    createPostFindingPartnerView,
    locationChangeView,
    locationChangeMapView,
    postDetailView,
    postFindingPartnerDetailView,
    profileView,
    editProfileView,
    walletView,
    paymentSummaryView,
    paymentPercentageView,
    paymentOptionsView,
    paymentAddCartView,
    requestView,
    aboutView,
    notificationsView,
    settingsView,
    resetPasswordView,
    helpView,
    // searchFilterView,
    searchHotelsView,
    hotelsSelectionView,
    bookingsView,
    privacyPolicyDetailsView,
    termsAndConditionsView,
    hotelDetailsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.onBoardingView, page: OnBoardingView),
    RouteDef(Routes.loginView, page: LoginView),
    // RouteDef(Routes.searchFilterView, page: SearchFilterPage),
    RouteDef(Routes.searchHotelsView, page: SearchHotelsPage),
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
    RouteDef(Routes.createPostShareRoomView, page: CreatePostShareRoomView),
    RouteDef(Routes.createPostFindingPartnerView,
        page: CreatePostFindingPartnerView),
    RouteDef(Routes.locationChangeView, page: LocationChangeView),
    RouteDef(Routes.locationChangeMapView, page: LocationChangeMapView),
    RouteDef(Routes.postDetailView, page: PostShareRoomDetailView),
    RouteDef(Routes.postFindingPartnerDetailView,
        page: PostFindingPartnerDetailView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.editProfileView, page: EditProfileView),
    RouteDef(Routes.walletView, page: WalletView),
    RouteDef(Routes.paymentSummaryView, page: PaymentSummaryView),
    RouteDef(Routes.paymentPercentageView, page: PaymentPercentageView),
    RouteDef(Routes.paymentOptionsView, page: PaymentOptionsView),
    RouteDef(Routes.paymentAddCartView, page: PaymentAddCartView),
    RouteDef(Routes.requestView, page: RequestView),
    // RouteDef(Routes.mapView, page: MapPageView),
    RouteDef(Routes.aboutView, page: AboutScreenView),
    RouteDef(Routes.notificationsView, page: NotificationsScreenView),
    RouteDef(Routes.settingsView, page: SettingsMainScreen),
    RouteDef(Routes.resetPasswordView, page: ResetPasswordView),
    RouteDef(Routes.helpView, page: HelpView),
    RouteDef(Routes.hotelsSelectionView, page: HotelLocationSelectionView),
    RouteDef(Routes.bookingsView, page: BookingScreen),
    RouteDef(Routes.privacyPolicyDetailsView, page: PrivacyPolicyDetailsView),
    RouteDef(Routes.termsAndConditionsView, page: TermsDetailsView),
    RouteDef(Routes.hotelDetailsView, page: HotelDetailsPage),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
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
    SearchLocationPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SearchLocationPage(),
        settings: data,
      );
    },
    // SearchFilterPage: (data) {
    //   return buildAdaptivePageRoute<dynamic>(
    //     builder: (context) => SearchFilterPage(),
    //     settings: data,
    //   );
    // },
    SearchHotelsPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SearchHotelsPage(),
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
    CreatePostShareRoomView: (data) {
      var args = data.getArgs<CreatePostShareRoomViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CreatePostShareRoomView(
          key: args.key,
        ),
        settings: data,
      );
    },
    CreatePostFindingPartnerView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CreatePostFindingPartnerView(),
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
    PostShareRoomDetailView: (data) {
      var args = data.getArgs<PostShareRoomDetailViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PostShareRoomDetailView(
          key: args.key,
          post: args.post,
        ),
        settings: data,
      );
    },
    PostFindingPartnerDetailView: (data) {
      var args =
          data.getArgs<PostFindingPartnerDetailViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PostFindingPartnerDetailView(
          key: args.key,
          post: args.post,
        ),
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
          // isMyProfile: args.isMyProfile,
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
    PaymentPercentageView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const PaymentPercentageView(),
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
    AboutScreenView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AboutScreenView(),
        settings: data,
      );
    },
    NotificationsScreenView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const NotificationsScreenView(),
        settings: data,
      );
    },
    SettingsMainScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SettingsMainScreen(),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ResetPasswordView(),
        settings: data,
      );
    },
    HelpView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HelpView(),
        settings: data,
      );
    },
    HotelLocationSelectionView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HotelLocationSelectionView(),
        settings: data,
      );
    },
    BookingScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => BookingScreen(),
        settings: data,
      );
    },
    PrivacyPolicyDetailsView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PrivacyPolicyDetailsView(),
        settings: data,
      );
    },
    TermsDetailsView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => TermsDetailsView(),
        settings: data,
      );
    },
    HotelDetailsPage: (data) {
      var args =
          data.getArgs<HotelDetailsViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HotelDetailsPage(hotel: args.hotel),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CreatePostView arguments holder class
class CreatePostShareRoomViewArguments {
  final Key? key;
  CreatePostShareRoomViewArguments({this.key});
}

/// CreatePostView arguments holder class
class PostShareRoomDetailViewArguments {
  final Key? key;
  final ShareRoomPost post;
  PostShareRoomDetailViewArguments({this.key, required this.post});
}

class PostFindingPartnerDetailViewArguments {
  final Key? key;
  final FindingPartnerPost post;
  PostFindingPartnerDetailViewArguments({this.key, required this.post});
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

class HotelDetailsViewArguments {
  final Key? key;
  final BookingHotelEntity hotel;
  HotelDetailsViewArguments({
    this.key,
    required this.hotel,
  });
}

class RegisterViewRoutes {
  // static const String registerPhoneView = '/';
  // static const String registerFormView = '/register-form-view';
  static const String registerFormView = '/';
  static const all = <String>{
    // registerPhoneView,
    registerFormView,
  };
}

class RegisterViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    // RouteDef(RegisterViewRoutes.registerPhoneView, page: RegisterPhoneView),
    RouteDef(RegisterViewRoutes.registerFormView, page: RegisterFormView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    // RegisterPhoneView: (data) {
    //   return buildAdaptivePageRoute<dynamic>(
    //     builder: (context) => const RegisterPhoneView(),
    //     settings: data,
    //   );
    // },
    RegisterFormView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RegisterFormView(),
        settings: data,
      );
    },
  };
}

class MainViewRoutes {
  static const String searchLocationView = '/';
  static const String mapView = '/map-view';
  static const String postView = '/post-view';
  static const String profileView = '/profile-view';
  static const all = <String>{
    searchLocationView,
    mapView,
    postView,
    profileView,
  };
}

class MainViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(MainViewRoutes.searchLocationView, page: SearchLocationPage),
    RouteDef(MainViewRoutes.mapView, page: MapPageView),
    RouteDef(MainViewRoutes.postView, page: PostsPageView),
    RouteDef(MainViewRoutes.profileView, page: ProfileView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SearchLocationPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SearchLocationPage(),
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
    ProfileView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },

    // Todo: Postponed to phase 2
    // ChatPageView: (data) {
    //   return buildAdaptivePageRoute<dynamic>(
    //     builder: (context) => const ChatPageView(),
    //     settings: data,
    //   );
    // },
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

  // Future<dynamic> navigateToNestedRegisterPhoneView({
  //   int? routerId,
  //   bool preventDuplicates = true,
  //   Map<String, String>? parameters,
  //   Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
  //   transition,
  // }) async {
  //   return navigateTo(
  //     RegisterViewRoutes.registerPhoneView,
  //     id: routerId,
  //     preventDuplicates: preventDuplicates,
  //     parameters: parameters,
  //     transition: transition,
  //   );
  // }

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
    dynamic args,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.oTPView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
      arguments: args,
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

  Future<dynamic> navigateToNestedSearchView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      MainViewRoutes.searchLocationView,
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

  Future<dynamic> navigateToNestedProfileView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      MainViewRoutes.profileView,
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

  Future<dynamic> navigateToCreatePostShareRoomView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.createPostShareRoomView,
      arguments: CreatePostShareRoomViewArguments(key: key),
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
    dynamic args,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.postDetailView,
      arguments: args,
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
