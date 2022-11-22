class ApiRoutes {
  // Auth
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String logout = 'auth/logout';

  // Posts
  static const String posts = 'posting';
  static const String postsByCurrentUser = 'posting/user';
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
  static String filteredHotels({
    String name = '',
    String city = '',
    String type = '',
    String minPrice = '',
    String maxPrice = '',
    String rating = '',
    String latitude = '',
    String longitude = '',
  }) =>
      'hotel?city=$city&type=$type&min_price=$minPrice&max_price=$maxPrice&rating=$rating&latitude=$latitude&longitude=$longitude&name=$name';
}
