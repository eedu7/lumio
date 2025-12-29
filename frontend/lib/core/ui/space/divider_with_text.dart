import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String label;

  const DividerWithText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFEEEEEE), // Very subtle grey
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const Expanded(child: Divider(thickness: 1, color: Color(0xFFEEEEEE))),
      ],
    );
  }
}
