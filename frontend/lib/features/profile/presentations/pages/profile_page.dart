import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/profile/presentations/widgets/logout_button.dart';
import 'package:frontend/features/profile/presentations/widgets/profile_menu_item.dart';
import 'package:frontend/features/profile/presentations/widgets/profile_section.dart';
import 'package:frontend/features/profile/presentations/widgets/user_info.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined, color: Colors.black87),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // 1. User Info Header
            UserInfo(),
            const SizedBox(height: 30),

            // 2. Orders Section
            ProfileSection(
              title: 'Orders',
              items: [
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.shopping_bag_outlined,
                  label: 'My Orders',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.local_shipping_outlined,
                  label: 'Order Tracking',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.history_rounded,
                  label: 'Order History',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.assignment_return_outlined,
                  label: 'Returns & Refunds',
                  onTap: () {},
                ),
              ],
            ),

            // 3. Payments Section
            ProfileSection(
              title: 'Payments',
              items: [
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.credit_card_outlined,
                  label: 'Saved Cards',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.account_balance_wallet_outlined,
                  label: 'Wallet / Balance',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.card_giftcard_outlined,
                  label: 'Gift Cards',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.confirmation_number_outlined,
                  label: 'Coupons',
                  onTap: () {},
                ),
              ],
            ),

            // 4. Addresses Section
            ProfileSection(
              title: 'Addresses',
              items: [
                ProfileMenuItem(
                  icon: Icons.location_on_outlined,
                  label: 'Shipping Addresses',
                  onTap: () => context.push(AppRoutes.shippingAddress),
                ),
              ],
            ),

            // 5. Support Section
            ProfileSection(
              title: 'Support',
              items: [
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.help_outline_rounded,
                  label: 'Help Center',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  enabled: false,
                  icon: Icons.chat_bubble_outline_rounded,
                  label: 'Chat with Support',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.quiz_outlined,
                  label: 'FAQs',
                  onTap: () => context.push(AppRoutes.faq),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Logout Button
            LogoutButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
