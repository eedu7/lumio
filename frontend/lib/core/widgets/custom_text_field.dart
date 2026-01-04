import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final String? hint;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    this.hint,
    this.label,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              label!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: enabled ? Colors.black : Colors.grey, // Visual feedback
              ),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            readOnly: readOnly,
            onTap: onTap,
            obscureText: obscureText,
            validator: validator,
            enabled: enabled,
            // Pass to TextFormField
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(
                prefixIcon,
                color: enabled ? Colors.grey[400] : Colors.grey[300],
                size: 20,
              ),
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: enabled ? Colors.white : Colors.grey[100],
              // Visual feedback
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                // Style for disabled state
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey[200]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.redAccent, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.redAccent,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
