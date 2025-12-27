class AppRoutes {
  AppRoutes._(); // Prevents instantiation

  // Authentication
  static const String signUp = '/sign-up';
  static const String login = '/login';
  static const String socialLogin = '/social-login';
  static const String forgotPassword = '/forgot-password';

  // Cart
  static const String chat = '/chat';

  // Cart
  static const String cart = '/cart';

  // Notifications
  static const String notifications = '/notifications';

  // Profile
  static const String profile = '/profile';

  // Home
  static const String home = '/';

  // Product Detail
  static const String productDetailPattern = '/home/:productId';

  static String productDetails(String productId) => '/home/$productId';
}
