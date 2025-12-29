import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_assets.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginIconButtonSmall(
          onPressed: () async => await _auth.signInWithGoogle(),
          logoUrl: AppAssets.googleIcon,
        ),
        const SizedBox(width: 24),
        SocialLoginIconButtonSmall(
          onPressed: () async => await _auth.signInWithGithub(),
          logoUrl: AppAssets.githubIcon,
        ),
      ],
    );
  }
}
