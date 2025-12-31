import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/services/supabase/supabase_auth.dart';
import 'package:frontend/core/widgets/custom_text_field.dart';
import 'package:frontend/features/auth/presentation/widgets/form_submit_button.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final SupabaseAuth _auth = SupabaseAuth();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      await _auth.signUp(email: email, password: password);
      if (mounted) context.go(AppRoutes.home);
    } on AuthException catch (e) {
      throw Exception('Something went wrong try again: $e');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Email Address
          CustomTextField(
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
            hint: 'Email Address',
            validator: (String? value) {
              if (value == null || value.isEmpty) return 'Email is required';
              if (!EmailValidator.validate(value)) return 'Invalid email';
              return null;
            },
          ),
          const SizedBox(height: 16),
          // Password
          CustomTextField(
            controller: _passwordController,
            prefixIcon: Icons.lock_outline,
            hint: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () => setState(() => _obscureText = !_obscureText),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) return 'Password is required';
              return null;
            },
          ),

          const SizedBox(height: 32),
          FormSubmitButton(
            label: 'Sign Up',
            onPressed: _isSubmitting ? null : _submit,
            isLoading: _isSubmitting,
          ),
        ],
      ),
    );
  }
}
