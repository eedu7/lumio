import 'package:flutter/material.dart';
import 'package:frontend/core/widgets/custom_text_field.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_heading.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_scaffold.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const AuthHeading(firstLine: 'Recover your', secondLine: 'Password'),
          const SizedBox(height: 16),
          Text(
            "Enter your email address and we'll send you a link to reset your password.",
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
          const SizedBox(height: 40),

          // Email Field
          CustomTextField(
            hint: 'Email Address',
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
          ),

          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Send Reset Link',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
