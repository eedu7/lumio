import 'package:flutter/material.dart';
import 'package:frontend/core/services/supabase/supabase_auth.dart';
import 'package:frontend/core/widgets/custom_text_field.dart';
import 'package:frontend/core/widgets/ui_notifications.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureNew = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_newPasswordController.text != _confirmPasswordController.text) {
      UiNotifications.showError(context, 'Passwords do not match');
      return;
    }

    setState(() => _isLoading = true);

    try {
      await SupabaseAuth().changePassword(
        password: _newPasswordController.text.trim(),
      );

      if (!mounted) return;

      UiNotifications.showSuccess(context, 'Password updated successfully');
      _newPasswordController.clear();
      _confirmPasswordController.clear();
      context.pop();
    } catch (_) {
      UiNotifications.showError(context, 'Failed to update password');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: 'New password',
            controller: _newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icons.lock_reset_outlined,
            obscureText: _obscureNew,
            validator: _newPasswordValidator,
            suffixIcon: IconButton(
              icon: Icon(_obscureNew ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => _obscureNew = !_obscureNew),
            ),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hint: 'Confirm New Password',
            controller: _confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icons.check_circle_outline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _newPasswordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Update Password',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  String? _newPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final errors = <String>[];

    if (value.length < 12) errors.add('• At least 12 characters');
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      errors.add('• Must contain letters');
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      errors.add('• Must contain numbers');
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      errors.add('• Must contain a special character');
    }

    return errors.isEmpty ? null : errors.join('\n');
  }
}
