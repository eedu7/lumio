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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              AppAssets.socialLoginEnterAssetImage,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 48),

            Text(
              "Let's you in",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 32),

            const SocialLoginButtonsLargeGroup(),

            const SizedBox(height: 24),
            const DividerWithText(label: 'or'),
            const SizedBox(height: 24),

            FormSubmitButton(
              label: 'Sign in with password',
              onPressed: () => context.push(AppRoutes.login),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
