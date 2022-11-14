class ApiRoutes {
  static const String register = 'auth/register';

  // Posts
  static const String posts = 'posting';
  static String postsByUserId(int userId) => 'posting/$userId';

  // Notifications
  static const String notifications = 'notification';

  // Profile
  static const String profile = 'user/profile';
  static const String occupation = 'occupation';
}
