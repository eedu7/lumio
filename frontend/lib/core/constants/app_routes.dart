class AppRoutes {
  AppRoutes._();

  // Authentication
  static const String signUp = '/sign-up';
  static const String login = '/login';
  static const String socialLogin = '/social-login';
  static const String forgotPassword = '/forgot-password';
  static const String changePassword = '/change-password';

  // Special Features
  static const String specialFeatures = '/special-features';
  
  // Chat
  static const String chat = '/chat';

  // Cart
  static const String cart = '/cart';

  // Congratulations
  static const String congratulations = '/congratulations';

  // checkout
  static const String checkout = '/checkout';

  // Shipping Address
  static const String shippingAddress = '/shipping-address';
  static const String addShippingAddress = '/shipping-address/add';
  static const String editShippingAddress = '/shipping-address/new';

  // settings
  static const String settings = '/settings';

  // Support
  static const String faq = '/support/faq';

  // Special Offer
  static const String specialOffers = '/special-offers';

  // Notifications
  static const String notifications = '/notifications';

  // Reviews
  static const String reviews = '/reviews';
  static const String reviewProductQuery = 'product-id';

  // Profile
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';

  // Home
  static const String home = '/';

  // Category
  static const String category = '/category';

  // Privacy Policy
  static const String privacyPolicy = '/settings/privacy-policy';
  static const String termsConditions = '/settings/terms-conditions';
  static const String about = '/settings/about';

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
    String? categoryId,
    String discount = '',
  }) {
    final uri = Uri(
      path: category,
      queryParameters: {
        qKey: key,
        qValue: value,
        discountKey: discount,
        'categoryId': categoryId,
      },
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
