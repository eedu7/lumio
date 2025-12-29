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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Image.asset(logoUrl, height: 24, width: 24, fit: BoxFit.contain),
      ),
    );
  }
}
