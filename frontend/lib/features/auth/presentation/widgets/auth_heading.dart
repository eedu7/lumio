import 'package:flutter/material.dart';

class AuthHeading extends StatelessWidget {
  final String firstLine;
  final String secondLine;

  const AuthHeading({
    super.key,
    required this.firstLine,
    required this.secondLine,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstLine,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black54,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          secondLine,
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: -1.0,
          ),
        ),
      ],
    );
  }
}
