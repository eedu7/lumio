import 'package:flutter/material.dart';

class SettingsToggleTile extends StatelessWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SettingsToggleTile({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SwitchListTile.adaptive(
      value: initialValue,
      activeThumbColor: theme.primaryColor,
      activeTrackColor: theme.primaryColor,
      title: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: theme.textTheme.bodyLarge?.color ?? Colors.black87,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
