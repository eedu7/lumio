import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_assets.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_scaffold.dart';

class SocialLoginPage extends StatelessWidget {
  const SocialLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      actionRoute: AppRoutes.signUp,
      actionText: 'Sign Up',
      helperText: 'Don\'t have an account?',
      body: Center(
        child: Column(
          spacing: 16.0,
          children: [Image.asset(AppAssets.socialLoginEnterAssetImage)],
        ),
      ),
    );
  }
}
