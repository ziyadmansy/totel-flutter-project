class ApiRoutes {
  static const String register = 'auth/register';

  // Posts
  static const String post = 'post';
  static const String notifications = 'notification';
  static String postById(int postId) => 'post/$postId';
}
