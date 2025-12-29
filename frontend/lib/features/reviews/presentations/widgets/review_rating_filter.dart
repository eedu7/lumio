import 'package:flutter/material.dart';

class ReviewRatingFilter extends StatefulWidget {
  const ReviewRatingFilter({super.key});

  @override
  State<ReviewRatingFilter> createState() => _ReviewRatingFilterState();
}

class _ReviewRatingFilterState extends State<ReviewRatingFilter> {
  static const String all = 'all';

  final List<String> _filters = [all, '5', '4', '3', '2', '1'];

  final Set<String> _selected = {all, '5', '4', '3', '2', '1'};

  void _onChipSelected(String value, bool selected) {
    setState(() {
      if (value == all) {
        // Select / unselect everything
        if (selected) {
          _selected
            ..clear()
            ..addAll(_filters);
        } else {
          _selected.clear();
        }
        return;
      }

      // Normal rating chip
      selected ? _selected.add(value) : _selected.remove(value);

      // If any rating is unselected, remove "All"
      _selected.remove(all);

      // If all ratings (1–5) are selected, auto-select "All"
      final ratingsOnly = _filters.where((e) => e != all);
      if (ratingsOnly.every(_selected.contains)) {
        _selected.add(all);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final value = _filters[index];
          final isSelected = _selected.contains(value);

          return FilterChip(
            selected: isSelected,
            showCheckmark: false,
            label: value == all
                ? const Text('All')
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        value,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                    ],
                  ),
            onSelected: (selected) => _onChipSelected(value, selected),
            selectedColor: colorScheme.primary,
            backgroundColor: colorScheme.surface,
            labelStyle: theme.textTheme.labelMedium?.copyWith(
              color: isSelected ? colorScheme.onPrimary : null,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          );
        },
      ),
    );
  }
}
