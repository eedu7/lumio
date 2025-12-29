import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String label;
  final String? trailingText;
  final VoidCallback? onTap;
  final bool isDestructive;
  final bool showArrow;

  const SettingsTile({
    super.key,
    required this.label,
    this.trailingText,
    this.onTap,
    this.isDestructive = false,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: isDestructive ? Colors.redAccent : Colors.black87,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText!,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          if (showArrow) ...[
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: Colors.grey,
            ),
          ],
        ],
      ),
    );
  }
}
