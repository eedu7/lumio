class AppRoutes {
  AppRoutes._(); // Prevents instantiation

  // Authentication
  static const String signUp = '/sign-up';
  static const String login = '/login';
  static const String socialLogin = '/social-login';

  // Products
  static const String products = '/products';

  // Product Detail
  static const String productDetailPattern = '/products/:productId';

  static String productDetails(String productId) => '/products/$productId';
}
