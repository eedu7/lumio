import 'package:flutter/material.dart';
import 'package:frontend/features/settings/presentations/widgets/content_text.dart';
import 'package:frontend/features/settings/presentations/widgets/custom_app_bar.dart';
import 'package:frontend/features/settings/presentations/widgets/section_title.dart';
import 'package:frontend/features/settings/presentations/widgets/web_link.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Privacy Policy'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: const [
          WebLink(url: 'https://fashionhub.com/privacy'),
          SectionTitle(title: '1. Types of Data We Collect'),
          ContentText(
            text:
                'We collect your name, email address, and shipping information '
                'when you create an account or make a purchase. We also collect '
                'device information to improve app performance.',
          ),
          SectionTitle(title: '2. Use of Cookies'),
          ContentText(
            text:
                'Our application uses local storage to keep you logged in and '
                'remember items in your shopping cart across sessions.',
          ),
        ],
      ),
    );
  }
}
