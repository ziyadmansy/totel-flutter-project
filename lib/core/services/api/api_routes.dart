class ApiRoutes {
  static const String register = 'auth/register';

  // Posts
  static const String posts = 'posting';
  static const String postsByCurrentUser = 'posting/user';
  static String deleteCurrentUserPost(int postId) => 'posting/user/$postId';

  // Notifications
  static const String notifications = 'notification';

  // Profile
  static const String profile = 'user/profile';
  static const String occupation = 'occupation';

  static String searchHotels(String searchKey) => 'hotel?city=$searchKey';
}
