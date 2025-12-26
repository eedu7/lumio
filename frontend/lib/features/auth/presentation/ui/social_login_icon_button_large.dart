import 'package:flutter/material.dart';

class SocialLoginIconButtonLarge extends StatelessWidget {
  final String label;
  final String iconUrl;
  final VoidCallback onPressed;

  const SocialLoginIconButtonLarge({
    super.key,
    required this.label,
    required this.iconUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.buttonTheme.colorScheme?.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.0,
        children: <Widget>[
          Image.asset(iconUrl, width: 24, height: 24),
          Text(label),
        ],
      ),
    );
  }
}
