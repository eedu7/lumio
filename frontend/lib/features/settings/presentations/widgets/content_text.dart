import 'package:flutter/material.dart';

class ContentText extends StatelessWidget {
  final String text;

  const ContentText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
        height: 1.6,
        letterSpacing: 0.2,
      ),
    );
  }
}
