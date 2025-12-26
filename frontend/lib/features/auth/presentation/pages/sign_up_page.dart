import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/ui/space/divider_with_text.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_heading.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:frontend/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:frontend/features/auth/presentation/widgets/social_login_button_small_group.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      actionRoute: AppRoutes.login,
      actionText: 'Login',
      helperText: 'Already have an account?',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 36.0,
        children: [
          // Heading
          AuthHeading(firstLine: 'Create your', secondLine: 'Account'),

          // SignUp Form
          SignUpForm(),

          // Divider
          DividerWithText(label: 'or continue with'),

          // Social Login
          SocialLoginButtonSmallGroup(),
        ],
      ),
    );
  }
}
