import 'package:flutter/material.dart';
import 'package:frontend/core/services/supabase/supabase_auth.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({super.key});

  final SupabaseAuth _auth = SupabaseAuth();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        await _auth.signOut();
      },
      icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
      label: const Text(
        'Logout',
        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
      ),
    );
  }
}
