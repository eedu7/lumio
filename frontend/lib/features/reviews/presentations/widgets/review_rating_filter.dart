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

  bool _noneSelected = false;

  bool get _isAllSelected =>
      !_noneSelected && _selected.length == _filters.length - 1;

  void _onChipSelected(String value) {
    setState(() {
      if (value == all) {
        if (_isAllSelected) {
          _selected.clear();
          _noneSelected = true;
        } else {
          _selected
            ..clear()
            ..addAll(_filters.where((e) => e != all));
          _noneSelected = false;
        }
        return;
      }

      _noneSelected = false;

      if (_selected.contains(value)) {
        _selected.remove(value);
      } else {
        _selected.add(value);
      }

      if (_selected.isEmpty) {
        _noneSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final value = _filters[index];

          final bool isSelected = value == all
              ? _isAllSelected
              : !_noneSelected && _selected.contains(value);

          return GestureDetector(
            onTap: () => _onChipSelected(value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? theme.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isSelected ? theme.primaryColor : Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [
                  if (value != all) ...[
                    Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: isSelected ? Colors.white : Colors.amber,
                    ),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    value == all ? 'All' : value,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
