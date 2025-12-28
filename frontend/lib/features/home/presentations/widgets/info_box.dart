import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String label;

  const InfoBox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Text(label, style: textTheme.labelSmall),
    );
  }
}
