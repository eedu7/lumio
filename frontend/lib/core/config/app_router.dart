import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/widgets/main_scaffold.dart';
import 'package:frontend/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:frontend/features/auth/presentation/pages/login_page.dart';
import 'package:frontend/features/auth/presentation/pages/sign_up_page.dart';
import 'package:frontend/features/auth/presentation/pages/social_login_page.dart';
import 'package:frontend/features/cart/presentations/pages/cart_page.dart';
import 'package:frontend/features/categories/pages/category_page.dart';
import 'package:frontend/features/chat/presentations/pages/chat_page.dart';
import 'package:frontend/features/home/presentations/pages/home_page.dart';
import 'package:frontend/features/notifications/presentations/pages/notifications_page.dart';
import 'package:frontend/features/profile/presentations/pages/profile_page.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home,
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
                GoRoute(
                  path: AppRoutes.category,
                  builder: (BuildContext context, GoRouterState state) {
                    final qKey = state.uri.queryParameters[AppRoutes.qKey]!;
                    final qValue = state.uri.queryParameters[AppRoutes.qValue]!;

                    return CategoryPage(qKey: qKey, qValue: qValue);
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
