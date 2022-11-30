import 'package:cheffy/Utils/constants.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_location_entity.dart';

class ApiRoutes {
  // Auth
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String logout = 'auth/logout';

  // Posts
  static const String getFindingPartnerPosts = 'posting/';
  static const String findingPartnerPosts = 'posting/find-partner';
  static const String shareRoomPosts = 'posting/share-room';
  static const String getCategories = 'category';

  static const String findingPartnerPostsByCurrentUser = 'posting/user';
  static const String shareRoomPostsByCurrentUser =
      'posting/user-room-listings';
  static String deleteCurrentUserPost(int postId) => 'posting/user/$postId';

  // Notifications
  static const String notifications = 'notification';

  // Profile
  static const String profile = 'user/profile';
  static const String occupation = 'occupation';

  // Reviews
  static const String userReviews = 'review/user';

  // Bookings
  static const String userBookings = 'booking/user';

  // Drawer Menu
  static const String help = 'help-menu';

  // Hotels
  static String searchHotelsLocationByName({required String name}) =>
      'v1/hotels/locations?name=$name&locale=$rapidApiLocale';

  static String hotelsByCoordinates(
          {required double lat, required double lon}) =>
      'hotel?latitude=$lat&longitude=$lon';

  static String filteredHotels({
    required String checkInDate,
    required String checkOutDate,
    required int adultsNo,
    required int roomsNo,
    required HotelLocationEntity hotelLocation,
  }) =>
      'v2/hotels/search?checkin_date=$checkInDate&checkout_date=$checkOutDate&adults_number=$adultsNo&room_number=$roomsNo&dest_type=${hotelLocation.destType}&dest_id=${hotelLocation.destId}&filter_by_currency=$filterCurrency&order_by=$rapidApiOrder&locale=$rapidApiLocale&units=$rapidApiMeasuringUnit&include_adjacency=$includeNearbyPlaces';
}
