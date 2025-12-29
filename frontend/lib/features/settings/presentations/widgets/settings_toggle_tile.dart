import 'package:flutter/material.dart';

class SettingsToggleTile extends StatefulWidget {
  final String label;
  final bool initialValue;

  const SettingsToggleTile({
    super.key,
    required this.label,
    required this.initialValue,
  });

  @override
  State<SettingsToggleTile> createState() => _SettingsToggleTileState();
}

class _SettingsToggleTileState extends State<SettingsToggleTile> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: _value,
      activeThumbColor: Theme.of(context).primaryColor,
      title: Text(
        widget.label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      onChanged: (val) => setState(() => _value = val),
    );
  }
}
