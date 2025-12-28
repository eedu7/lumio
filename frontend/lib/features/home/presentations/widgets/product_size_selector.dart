import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/label.dart';

class ProductSizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSelected;

  const ProductSizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      spacing: 4.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: 'Size'),
        Wrap(
          spacing: 8,
          children: sizes.map((size) {
            final isSelected = size == selectedSize;
            return ChoiceChip(
              shape: StadiumBorder(),
              showCheckmark: false,
              label: Text(size),
              selected: isSelected,
              onSelected: (_) => onSelected(size),
              selectedColor: theme.colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
