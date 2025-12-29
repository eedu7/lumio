import 'package:flutter/material.dart';
import 'package:frontend/features/notifications/constants/notification_types.dart';
import 'package:frontend/features/notifications/presentations/widgets/notification_card.dart';
import 'package:frontend/features/notifications/presentations/widgets/notifications_group.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 72,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: const [
          NotificationsGroup(
            label: 'Today',
            items: [
              NotificationCard(
                notificationType: NotificationType.delivery,
                title: 'Order Delivered',
                description:
                    'Your order #1234 has been successfully delivered to your doorstep.',
              ),
            ],
          ),
          SizedBox(height: 16),
          NotificationsGroup(
            label: 'Yesterday',
            items: [
              NotificationCard(
                notificationType: NotificationType.offer,
                title: 'Special Offer',
                description:
                    'Flash sale! Get 20% off on your next order using code FLASH20.',
              ),
              NotificationCard(
                notificationType: NotificationType.shipment,
                title: 'Order Shipped',
                description:
                    'Your order #1233 is on the way and will arrive within 2 days.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
