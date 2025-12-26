import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_assets.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/ui/space/divider_with_text.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:frontend/features/auth/presentation/widgets/form_submit_button.dart';
import 'package:frontend/features/auth/presentation/widgets/social_login_buttons_large_group.dart';
import 'package:go_router/go_router.dart';

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
          spacing: 36.0,
          children: [
            Image.asset(AppAssets.socialLoginEnterAssetImage),
            // Social Login Buttons
            SocialLoginButtonsLargeGroup(),

            // Divider
            DividerWithText(label: 'or'),

            // Sign In Button
            FormSubmitButton(
              label: 'Sign in with password',
              onPressed: () => context.push(AppRoutes.login),
            ),
          ],
        ),
      ),
    );
  }
}
