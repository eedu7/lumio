import 'package:flutter/material.dart';

class SocialLoginIconButtonSmall extends StatelessWidget {
  final VoidCallback onPressed;
  final String logoUrl;

  const SocialLoginIconButtonSmall({
    super.key,
    required this.onPressed,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Image.asset(logoUrl, width: 24, height: 24),
    );
  }
}
