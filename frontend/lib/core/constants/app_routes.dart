class AppRoutes {
  AppRoutes._();

  // Authentication
  static const String signUp = '/sign-up';
  static const String login = '/login';
  static const String socialLogin = '/social-login';
  static const String forgotPassword = '/forgot-password';

  // Chat
  static const String chat = '/chat';

  // Cart
  static const String cart = '/cart';

  // Notifications
  static const String notifications = '/notifications';

  // Profile
  static const String profile = '/profile';

  // Home
  static const String home = '/';

  // Category
  static const String category = '/category';

  // Query param names
  static const String qKey = 'key';
  static const String qValue = 'value';

  // Allowed category query keys (IMPORTANT)
  static const String categoryName = 'categoryName';
  static const String collection = 'collection';

  // Product Detail
  static const String productDetailPattern = 'product/:productId';

  // Helpers
  static String productDetails(String productId) => '/$productId';

  static String categoryProducts({required String key, required String value}) {
    final uri = Uri(
      path: category,
      queryParameters: {qKey: key, qValue: value},
    );
    return uri.toString();
  }
}
