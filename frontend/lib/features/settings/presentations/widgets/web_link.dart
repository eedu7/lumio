import 'package:flutter/material.dart';

class WebLink extends StatelessWidget {
  final String url;

  const WebLink({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.language_rounded, size: 20, color: Colors.blue),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'View web version',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Icon(
            Icons.open_in_new_rounded,
            size: 16,
            color: Colors.blue.withValues(alpha: 0.4),
          ),
        ],
      ),
    );
  }
}
