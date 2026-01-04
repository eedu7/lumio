import 'package:frontend/core/services/local_storage_service.dart';
import 'package:frontend/core/services/supabase/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  final SupabaseClient supabase = SupabaseService.client;

  String _handleError(dynamic e) {
    if (e is AuthException) {
      switch (e.code) {
        case 'invalid_credentials':
          return 'Invalid email or password.';
        case 'email_not_confirmed':
          return 'Please verify your email address.';
        case 'user_not_found':
          return 'No user found with this email.';
        default:
          return e.message;
      }
    }
    return 'An unexpected error occurred';
  }

  Future<AuthResponse> signInWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.session != null) {
        await LocalStorageService.setBoolean(PrefBoolKey.isLoggedIn, true);
      }
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    await LocalStorageService.setBoolean(PrefBoolKey.isLoggedIn, false);
  }

  Future<void> signInWithGoogle() async =>
      await supabase.auth.signInWithOAuth(OAuthProvider.google);

  Future<void> signInWithGithub() async =>
      await supabase.auth.signInWithOAuth(OAuthProvider.github);
}
