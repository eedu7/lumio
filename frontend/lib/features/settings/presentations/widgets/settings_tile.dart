import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String label;
  final String? trailingText;
  final VoidCallback? onTap;
  final bool isDestructive;
  final bool showArrow;
  final bool enabled;

  const SettingsTile({
    super.key,
    required this.label,
    this.trailingText,
    this.onTap,
    this.isDestructive = false,
    this.showArrow = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    Color getTitleColor() {
      if (!enabled) return Colors.grey.shade400;
      if (isDestructive) return Colors.redAccent;
      return Colors.black87;
    }

    return ListTile(
      onTap: enabled ? onTap : null,
      title: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: getTitleColor(),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText!,
              style: TextStyle(
                color: enabled ? Colors.grey : Colors.grey.shade300,
                fontSize: 13,
              ),
            ),
          if (showArrow) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: enabled ? Colors.grey : Colors.grey.shade300,
            ),
          ],
        ],
      ),
    );
  }
}
