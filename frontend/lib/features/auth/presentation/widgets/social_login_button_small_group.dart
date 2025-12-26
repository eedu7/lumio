import 'package:flutter/material.dart';
import 'package:frontend/core/services/supabase/supabase_auth.dart';
import 'package:frontend/features/auth/presentation/ui/social_login_icon_button_small.dart';

class SocialLoginButtonSmallGroup extends StatefulWidget {
  const SocialLoginButtonSmallGroup({super.key});

  @override
  State<SocialLoginButtonSmallGroup> createState() =>
      _SocialLoginButtonSmallGroupState();
}

class _SocialLoginButtonSmallGroupState
    extends State<SocialLoginButtonSmallGroup> {
  final SupabaseAuth _auth = SupabaseAuth();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24.0,
      children: [
        SocialLoginIconButtonSmall(
          onPressed: () async {
            await _auth.signInWithGoogle();
          },
          logoUrl: 'assets/logos/google-logo.png',
        ),
        SocialLoginIconButtonSmall(
          onPressed: () async {
            await _auth.signInWithGithub();
          },
          logoUrl: 'assets/logos/github-logo.png',
        ),
      ],
    );
  }
}
