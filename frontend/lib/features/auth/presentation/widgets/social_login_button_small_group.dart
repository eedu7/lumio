import 'package:flutter/material.dart';
import 'package:frontend/features/auth/presentation/ui/social_login_icon_button_small.dart';

class SocialLoginButtonSmallGroup extends StatefulWidget {
  const SocialLoginButtonSmallGroup({super.key});

  @override
  State<SocialLoginButtonSmallGroup> createState() =>
      _SocialLoginButtonSmallGroupState();
}

class _SocialLoginButtonSmallGroupState
    extends State<SocialLoginButtonSmallGroup> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24.0,
      children: [
        SocialLoginIconButtonSmall(
          onPressed: () {},
          logoUrl: 'assets/logos/google-logo.png',
        ),
        SocialLoginIconButtonSmall(
          onPressed: () {},
          logoUrl: 'assets/logos/github-logo.png',
        ),
      ],
    );
  }
}
