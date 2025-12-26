import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_scaffold.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      actionRoute: AppRoutes.login,
      actionText: 'Login',
      helperText: 'Already have an account?',
      body: const Center(
        child: Text(
          'Forgot Password',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
