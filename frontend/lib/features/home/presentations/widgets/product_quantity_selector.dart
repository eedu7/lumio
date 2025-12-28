import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/label.dart';

class ProductQuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;

  const ProductQuantitySelector({
    super.key,
    required this.quantity,
    required this.onChanged,
    this.min = 1,
    this.max = 99,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12.0,
      children: [
        Label(text: 'Quantity'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              color: quantity <= min ? Colors.grey : null,
              onPressed: quantity > min ? () => onChanged(quantity - 1) : null,
              icon: const Icon(Icons.remove),
            ),
            Container(
              width: 40,
              alignment: Alignment.center,
              child: Text(
                quantity.toString(),
                style: theme.textTheme.titleMedium,
              ),
            ),
            IconButton(
              onPressed: quantity < max ? () => onChanged(quantity + 1) : null,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
