import 'package:flutter/material.dart';

class UiNotifications {
  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(context, message: message, isError: false);
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(context, message: message, isError: true);
  }

  static void _showSnackBar(
    BuildContext context, {
    required String message,
    required bool isError,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: isError ? colorScheme.onError : Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: isError ? colorScheme.onError : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: isError ? colorScheme.error : Colors.green[600],
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        showCloseIcon: true,
        closeIconColor: isError ? colorScheme.onError : Colors.white,
      ),
    );
  }
}
