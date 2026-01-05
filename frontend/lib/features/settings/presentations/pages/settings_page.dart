import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/theme/theme_manager.dart';
import 'package:frontend/features/settings/presentations/widgets/settings_section.dart';
import 'package:frontend/features/settings/presentations/widgets/settings_tile.dart';
import 'package:frontend/features/settings/presentations/widgets/settings_toggle_tile.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeManager = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        centerTitle: true,
        leadingWidth: 72,
        title: const Text(
          'Settings',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          // 1. Account Section
          SettingsSection(
            title: 'Account',
            items: [
              SettingsTile(
                label: 'Change Password',
                onTap: () => context.push(AppRoutes.changePassword),
              ),
              SettingsTile(
                enabled: false,
                label: 'Email / Phone Verification',
                trailingText: 'Verified',
                onTap: () {
                  // TODO: Implement email / phone verification
                },
              ),
              SettingsTile(
                enabled: false,
                label: 'Delete Account',
                isDestructive: true,
                onTap: () {
                  // TODO: Implement Delete Account functionality
                },
              ),
            ],
          ),

          // 2. Preferences Section
          SettingsSection(
            title: 'Preferences',
            items: [
              SettingsTile(
                label: 'Language',
                trailingText: 'English (US)',
                enabled: false,
                onTap: () {
                  // TODO: Implement language change
                },
              ),
              SettingsTile(
                label: 'Currency',
                trailingText: 'USD (\$)',
                enabled: false,
                onTap: () {
                  // TODO: Implement currency chage
                },
              ),
              SettingsToggleTile(
                label: 'Dark Mode',
                initialValue: themeManager.isDarkMode,
                onChanged: (bool value) {
                  ref.read(themeProvider).toggleTheme(value);
                },
              ),
              SettingsTile(
                label: 'Notification Preferences',
                onTap: () {
                  // TODO: Implement Dark Mode
                },
              ),
            ],
          ),

          // 3. Privacy & Security Section
          SettingsSection(
            title: 'Privacy & Security',
            items: [
              SettingsTile(
                label: 'Privacy Policy',
                onTap: () => context.push(AppRoutes.privacyPolicy),
              ),
              SettingsTile(
                label: 'Terms & Conditions',
                onTap: () => context.push(AppRoutes.termsConditions),
              ),
            ],
          ),

          // 4. App Info Section
          SettingsSection(
            title: 'App Info',
            items: [
              const SettingsTile(
                label: 'App Version',
                trailingText: 'v2.4.0',
                showArrow: false,
              ),
              SettingsTile(
                label: 'Rate App',
                onTap: () {
                  // TODO: Implement app rating
                },
              ),
              SettingsTile(
                label: 'About',
                onTap: () => context.push(AppRoutes.about),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
