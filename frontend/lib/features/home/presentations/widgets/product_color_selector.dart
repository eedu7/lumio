import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/label.dart';

class ProductColorSelector extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final ValueChanged<Color> onSelected;

  const ProductColorSelector({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      spacing: 4.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: 'Color'),
        Wrap(
          spacing: 8,
          children: colors.map((color) {
            final isSelected = color == selectedColor;

            return InkWell(
              borderRadius: BorderRadius.circular(999),
              onTap: () => onSelected(color),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  border: Border.all(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.dividerColor,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        size: 18,
                        color: theme.colorScheme.onPrimary,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
