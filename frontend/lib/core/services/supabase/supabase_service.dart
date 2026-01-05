import 'package:frontend/core/config/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> init() async {
    await Supabase.initialize(
      url: ENV.SUPABASE_PROJECT_URL,
      anonKey: ENV.SUPABASE_ANON_KEY,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;

  static Map<String, dynamic>? getUserFromAuth() {
    final user = client.auth.currentUser;
    if (user == null) return null;

    return {
      'full_name': user.userMetadata?['full_name'] ?? "Anonymous User",
      'avatar_url': user.userMetadata?['avatar_url'],
      'email': user.email ?? "No email provided",
    };
  }
}
