import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/services/supabase/supabase_auth.dart';
import 'package:frontend/core/widgets/custom_text_field.dart';
import 'package:frontend/features/auth/presentation/widgets/form_submit_button.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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

      await _auth.signInWithPassword(email: email, password: password);

      if (mounted) {
        context.go(AppRoutes.home);
      }
    } on AuthException catch (e) {
      throw Exception('Something went wrong try again: $e');
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
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
            keyboardType: TextInputType.emailAddress,
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
            obscureText: _obscureText,
            controller: _passwordController,
            prefixIcon: Icons.lock_outline,
            keyboardType: TextInputType.visiblePassword,
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

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => context.push(AppRoutes.forgotPassword),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          FormSubmitButton(
            label: 'Log In',
            onPressed: _isSubmitting ? null : _submit,
            isLoading: _isSubmitting,
          ),
        ],
      ),
    );
  }
}
