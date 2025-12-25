
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENV {

  // Supabase Configuration
  static String get SUPABASE_PROJECT_URL => dotenv.env['SUPABASE_PROJECT_URL'] ?? '';
  static String get SUPABASE_ANON_KEY => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
}
