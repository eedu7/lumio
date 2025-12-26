import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;

  const HeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: theme.primaryColor,
      ),
    );
  }
}
