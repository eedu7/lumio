import 'package:flutter/material.dart';
import 'package:frontend/core/ui/typography/heading_text.dart';

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
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <HeadingText>[
        HeadingText(text: firstLine),
        HeadingText(text: secondLine),
      ],
    );
  }
}
