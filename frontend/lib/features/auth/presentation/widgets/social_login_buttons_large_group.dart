import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_assets.dart';
import 'package:frontend/core/services/supabase/supabase_auth.dart';
import 'package:frontend/features/auth/presentation/ui/social_login_icon_button_large.dart';

class SocialLoginButtonsLargeGroup extends StatefulWidget {
  const SocialLoginButtonsLargeGroup({super.key});

  @override
  State<SocialLoginButtonsLargeGroup> createState() =>
      _SocialLoginButtonsLargeGroupState();
}

class _SocialLoginButtonsLargeGroupState
    extends State<SocialLoginButtonsLargeGroup> {
  final SupabaseAuth _auth = SupabaseAuth();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginIconButtonLarge(
          label: 'Continue with Google',
          iconUrl: AppAssets.googleIcon,
          onPressed: () async => await _auth.signInWithGoogle(),
        ),
        const SizedBox(height: 16),
        SocialLoginIconButtonLarge(
          label: 'Continue with Github',
          iconUrl: AppAssets.githubIcon,
          onPressed: () async => await _auth.signInWithGithub(),
        ),
      ],
    );
  }
}
