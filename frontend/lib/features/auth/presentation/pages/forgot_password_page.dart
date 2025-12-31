import 'package:email_validator/email_validator.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  /*
  // TODO: Implement this
  final SupabaseAuth _auth = SupabaseAuth();
  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = _emailController.text.trim();
    await _auth.sendPasswordResetEmail(email: email);
  }
  */

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const AuthHeading(
              firstLine: 'Recover your',
              secondLine: 'Password',
            ),
            const SizedBox(height: 16),
            Text(
              "Enter your email address and we'll send you a link to reset your password.",
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            const SizedBox(height: 32),

            // Notification box to tell the user the feature is inactive
            _infoBox(),

            const SizedBox(height: 32),

            // Email Field
            CustomTextField(
              readOnly: true,
              // TODO: Disable this in production
              hint: 'Email Address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email_outlined,
              validator: (String? value) {
                if (value == null || value.isEmpty) return 'Email is required';
                if (!EmailValidator.validate(value)) return 'Invalid email';
                return null;
              },
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBackgroundColor: Colors.grey[300],
                  disabledForegroundColor: Colors.grey[600],
                ),
                child: const Text(
                  'Send Reset Link',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.blue[700], size: 24),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "This feature is currently under maintenance and will be enabled soon.",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
