import 'package:flutter/material.dart';
import 'package:frontend/features/notifications/constants/notification_types.dart';

class NotificationCard extends StatelessWidget {
  final NotificationType notificationType;
  final String title;
  final String description;

  const NotificationCard({
    super.key,
    required this.notificationType,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = _getColor(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Styled Icon Section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(_getIcon(), color: accentColor, size: 24),
          ),
          const SizedBox(width: 16),
          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Icons and Colors logic remains similar but updated for visual balance
  IconData _getIcon() {
    switch (notificationType) {
      case NotificationType.offer:
        return Icons.local_offer_rounded;
      case NotificationType.delivery:
        return Icons.check_circle_rounded;
      case NotificationType.shipment:
        return Icons.local_shipping_rounded;
      default:
        return Icons.notifications_rounded;
    }
  }

  Color _getColor(BuildContext context) {
    switch (notificationType) {
      case NotificationType.offer:
        return Colors.orange[400]!;
      case NotificationType.delivery:
        return Colors.green[400]!;
      case NotificationType.shipment:
        return Colors.blue[400]!;
      default:
        return Colors.grey[400]!;
    }
  }
}
