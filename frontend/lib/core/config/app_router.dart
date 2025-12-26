import 'package:flutter/cupertino.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:frontend/features/auth/presentation/pages/login_page.dart';
import 'package:frontend/features/auth/presentation/pages/sign_up_page.dart';
import 'package:frontend/features/auth/presentation/pages/social_login_page.dart';
import 'package:frontend/features/home/presentations/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.socialLogin,
  routes: <RouteBase>[
    // Home
    GoRoute(
      path: AppRoutes.home,
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),

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
  ],
);
