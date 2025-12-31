import 'package:flutter/material.dart';
import 'package:frontend/features/settings/presentations/widgets/brand_identity_section.dart';
import 'package:frontend/features/settings/presentations/widgets/content_text.dart';
import 'package:frontend/features/settings/presentations/widgets/custom_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'About Us'),
      body: const Column(
        children: [
          SizedBox(height: 60),
          BrandIdentitySection(),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: ContentText(
              text:
                  'Lumio is a community-driven e-commerce platform '
                  'designed to bring you the latest trends with a focus on '
                  'sustainability and ethical sourcing.',
            ),
          ),
          Spacer(),
          Text(
            'Version 2.4.0',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
