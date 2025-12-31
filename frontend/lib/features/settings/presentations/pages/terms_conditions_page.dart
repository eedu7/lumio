import 'package:flutter/material.dart';
import 'package:frontend/features/settings/presentations/widgets/content_text.dart';
import 'package:frontend/features/settings/presentations/widgets/custom_app_bar.dart';
import 'package:frontend/features/settings/presentations/widgets/section_title.dart';
import 'package:frontend/features/settings/presentations/widgets/web_link.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Terms & Conditions'),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          WebLink(url: 'https://yourstore.com/terms'),
          const SizedBox(height: 24),
          SectionTitle(title: '1. Acceptance of Terms'),
          ContentText(
            text:
                'By accessing this application, you agree to be bound by these Terms and Conditions. '
                'If you do not agree, please do not use the app.',
          ),
          SectionTitle(title: '2. User Accounts'),
          ContentText(
            text:
                'You are responsible for maintaining the confidentiality of your account and password. '
                'Any fraudulent activity may result in account termination.',
          ),
          SectionTitle(title: '3. Payments & Shipping'),
          ContentText(
            text:
                'All transactions are processed securely. Shipping times vary based on location '
                'and availability of stock.',
          ),
        ],
      ),
    );
  }
}
