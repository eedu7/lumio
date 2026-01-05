import 'package:flutter/material.dart';
import 'package:frontend/core/services/supabase/supabase_service.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = SupabaseService.getUserFromAuth();

    if (profile == null) {
      return const Center(child: Text("No user logged in"));
    }

    final String name = profile['full_name'];
    final String email = profile['email'];
    final String? avatarUrl = profile['avatar_url'];

    final String initial = name.isNotEmpty ? name[0].toUpperCase() : "?";

    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: theme.primaryColor.withValues(alpha: 0.1),
          backgroundImage: (avatarUrl != null && avatarUrl.isNotEmpty)
              ? NetworkImage(avatarUrl)
              : null,
          child: (avatarUrl == null || avatarUrl.isEmpty)
              ? Text(
                  initial,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: Colors.black87,
          ),
        ),
        Text(
          email,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        // TODO: Edit Profile
        // const SizedBox(height: 12),
        // SizedBox(
        //   height: 36,
        //   child: OutlinedButton(
        //     onPressed: () => context.push(AppRoutes.editProfile),
        //     style: OutlinedButton.styleFrom(
        //       shape: const StadiumBorder(),
        //       side: BorderSide(color: Colors.grey.shade300),
        //     ),
        //     child: const Text(
        //       'Edit Profile',
        //       style: TextStyle(fontSize: 12, color: Colors.black87),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
