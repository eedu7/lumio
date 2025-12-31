import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/widgets/main_scaffold.dart';
import 'package:frontend/features/auth/presentation/pages/change_password_page.dart';
import 'package:frontend/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:frontend/features/auth/presentation/pages/login_page.dart';
import 'package:frontend/features/auth/presentation/pages/sign_up_page.dart';
import 'package:frontend/features/auth/presentation/pages/social_login_page.dart';
import 'package:frontend/features/cart/presentations/pages/cart_page.dart';
import 'package:frontend/features/categories/pages/category_page.dart';
import 'package:frontend/features/chat/presentations/pages/chat_page.dart';
import 'package:frontend/features/checkout/presentations/pages/checkout_page.dart';
import 'package:frontend/features/home/presentations/pages/home_page.dart';
import 'package:frontend/features/home/presentations/pages/product_detail_page.dart';
import 'package:frontend/features/notifications/presentations/pages/notifications_page.dart';
import 'package:frontend/features/profile/presentations/pages/edit_profile_page.dart';
import 'package:frontend/features/profile/presentations/pages/profile_page.dart';
import 'package:frontend/features/reviews/presentations/pages/reviews_page.dart';
import 'package:frontend/features/settings/presentations/pages/about_page.dart';
import 'package:frontend/features/settings/presentations/pages/privacy_policy_page.dart';
import 'package:frontend/features/settings/presentations/pages/settings_page.dart';
import 'package:frontend/features/settings/presentations/pages/terms_conditions_page.dart';
import 'package:frontend/features/shipping-address/presentations/pages/billing_address_page.dart';
import 'package:frontend/features/shipping-address/presentations/pages/shipping_address_page.dart';
import 'package:frontend/features/special_offers/presentations/special_offers_page.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.chat,
  routes: <RouteBase>[
    // Authentication
    GoRoute(
      path: AppRoutes.signUp,
      builder: (BuildContext context, GoRouterState state) =>
          const SignUpPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.socialLogin,
      builder: (BuildContext context, GoRouterState state) =>
          const SocialLoginPage(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (BuildContext context, GoRouterState state) =>
          const ForgotPasswordPage(),
    ),
    GoRoute(
      path: AppRoutes.changePassword,
      builder: (BuildContext context, GoRouterState state) =>
          const ChangePasswordPage(),
    ),

    // Product Details
    GoRoute(
      path: AppRoutes.productDetail,
      builder: (BuildContext context, GoRouterState state) {
        final productId = state.uri.queryParameters[AppRoutes.productKey]!;

        return ProductDetailPage(productId: productId);
      },
    ),

    // Checkout
    GoRoute(
      path: AppRoutes.checkout,
      builder: (BuildContext context, GoRouterState state) {
        return CheckoutPage();
      },
    ),

    // Shipping Address
    GoRoute(
      path: AppRoutes.shippingAddress,
      builder: (BuildContext context, GoRouterState state) {
        return ShippingAddressPage();
      },
    ),

    // Billing Address
    GoRoute(
      path: AppRoutes.billingAddress,
      builder: (BuildContext context, GoRouterState state) {
        return BillingAddressPage();
      },
    ),

    // Reviews
    GoRoute(
      path: AppRoutes.reviews,
      builder: (BuildContext context, GoRouterState state) {
        final productId = state.uri.queryParameters[AppRoutes.productKey]!;

        return ReviewsPage(productId: productId);
      },
    ),

    // Settings
    GoRoute(
      path: AppRoutes.settings,
      builder: (BuildContext context, GoRouterState state) {
        return SettingsPage();
      },
    ),

    // Privacy Policy
    GoRoute(
      path: AppRoutes.privacyPolicy,
      builder: (BuildContext context, GoRouterState state) {
        return PrivacyPolicyPage();
      },
    ),

    // Terms and Conditions
    GoRoute(
      path: AppRoutes.termsConditions,
      builder: (BuildContext context, GoRouterState state) {
        return TermsConditionsPage();
      },
    ),

    // About
    GoRoute(
      path: AppRoutes.about,
      builder: (BuildContext context, GoRouterState state) {
        return AboutPage();
      },
    ),

    // Edit Profile
    GoRoute(
      path: AppRoutes.editProfile,
      builder: (BuildContext context, GoRouterState state) =>
          const EditProfilePage(),
    ),

    // Special Offer
    GoRoute(
      path: AppRoutes.specialOffers,
      builder: (BuildContext context, GoRouterState state) {
        return SpecialOffersPage();
      },
    ),

    // Main App Shell
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        // Branch Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (BuildContext context, GoRouterState state) =>
                  const HomePage(),
              routes: [
                // Category
                GoRoute(
                  path: AppRoutes.category,
                  builder: (BuildContext context, GoRouterState state) {
                    final qKey = state.uri.queryParameters[AppRoutes.qKey]!;
                    final qValue = state.uri.queryParameters[AppRoutes.qValue]!;
                    final discount =
                        state.uri.queryParameters[AppRoutes.discountKey] ?? '';

                    final bool showCategoryButton =
                        qKey == AppRoutes.collection;

                    return CategoryPage(
                      qKey: qKey,
                      qValue: qValue,
                      discount: discount,
                      showCategoryButton: showCategoryButton,
                    );
                  },
                ),
              ],
            ),
          ],
        ),

        // Branch Cart
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.cart,
              builder: (BuildContext context, GoRouterState state) =>
                  const CartPage(),
            ),
          ],
        ),

        // Branch Chat
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.chat,
              builder: (BuildContext context, GoRouterState state) =>
                  const ChatPage(),
            ),
          ],
        ),

        // Branch Notifications
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.notifications,
              builder: (BuildContext context, GoRouterState state) =>
                  const NotificationsPage(),
            ),
          ],
        ),

        // Branch Profile
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (BuildContext context, GoRouterState state) =>
                  const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
