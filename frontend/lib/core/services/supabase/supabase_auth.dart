import 'package:frontend/core/services/supabase/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  final SupabaseClient supabase = SupabaseService.client;

  // Sign in with email and password
  Future<AuthResponse> signInWithPassword({
    required String email,
    required String password,
  }) async {
    return supabase.auth.signInWithPassword(email: email, password: password);
  }

  // Sign Up with email and password
  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    return supabase.auth.signUp(email: email, password: password);
  }

  // Sign out
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  // Sign in with google
  Future<void> signInWithGoogle() async {
    await supabase.auth.signInWithOAuth(OAuthProvider.google);
  }

  // Sign in with github
  Future<void> signInWithGithub() async {
    await supabase.auth.signInWithOAuth(OAuthProvider.github);
  }

  // Change Password
  Future<void> changePassword({required String password}) async {
    await supabase.auth.updateUser(UserAttributes(password: password));
  }

  // Send Password Reset email
  Future<void> sendPasswordResetEmail({required String email}) async {
    await supabase.auth.resetPasswordForEmail(email);
  }
}
