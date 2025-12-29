import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/ui/space/divider_with_text.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_heading.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:frontend/features/auth/presentation/widgets/login_form.dart';
import 'package:frontend/features/auth/presentation/widgets/social_login_button_small_group.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      actionRoute: AppRoutes.signUp,
      actionText: 'Sign Up',
      helperText: 'Don\'t have an account?',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const AuthHeading(
              firstLine: 'Login to your',
              secondLine: 'Account',
            ),
            const SizedBox(height: 40),
            const LoginForm(),
            const SizedBox(height: 40),
            const DividerWithText(label: 'or continue with'),
            const SizedBox(height: 32),
            const SocialLoginButtonSmallGroup(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
