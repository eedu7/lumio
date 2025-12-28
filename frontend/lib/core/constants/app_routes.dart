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

  // Reviews
  static const String reviews = '/reviews';
  static const String reviewProductQuery = 'product-id';

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
  static const String discountKey = 'discount';

  // Product Detail
  static const String productDetail = '/product';
  static const String productKey = 'product-id';

  // Helpers
  static String productsDetail({required String productId}) {
    final uri = Uri(
      path: productDetail,
      queryParameters: {productKey: productId},
    );
    return uri.toString();
  }

  static String categoryProducts({
    required String key,
    required String value,
    String discount = '',
  }) {
    final uri = Uri(
      path: category,
      queryParameters: {qKey: key, qValue: value, discountKey: discount},
    );
    return uri.toString();
  }

  static String reviewProduct({required String productId}) {
    final uri = Uri(
      path: reviews,
      queryParameters: {reviewProductQuery: productId},
    );
    return uri.toString();
  }
}
