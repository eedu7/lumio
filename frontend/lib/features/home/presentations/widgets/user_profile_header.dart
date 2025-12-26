import 'package:flutter/material.dart';

class UserProfileHeader extends StatelessWidget {
  final String username;
  final String greeting;

  const UserProfileHeader({
    super.key,
    required this.username,
    this.greeting = 'Good Morning! 👋',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Left: Avatar + Text
        Expanded(
          child: Row(
            children: [
              CircleAvatar(radius: 22, child: Text(username)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    greeting,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// Right: Actions
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ],
        ),
      ],
    );
  }
}
