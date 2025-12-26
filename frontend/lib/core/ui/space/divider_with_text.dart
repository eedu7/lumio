import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String label;

  const DividerWithText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        spacing: 12.0,
        children: <Widget>[
          Expanded(child: Divider()),
          Text(label),
          Expanded(child: Divider()),
        ],
      ),
    );
  }
}
