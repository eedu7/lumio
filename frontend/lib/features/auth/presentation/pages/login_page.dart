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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 32.0,
        children: [
          // Heading
          AuthHeading(firstLine: 'Create your', secondLine: 'Account'),

          // Login Form
          LoginForm(),

          // Divider
          DividerWithText(label: 'or continue with'),

          // Social Login
          SocialLoginButtonSmallGroup(),
        ],
      ),
    );
  }
}
