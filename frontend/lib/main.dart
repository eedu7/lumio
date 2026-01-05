import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/config/app_router.dart';
import 'package:frontend/core/services/local_storage_service.dart';
import 'package:frontend/core/services/supabase/supabase_service.dart';
import 'package:frontend/core/theme/theme_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Loading environment
  await dotenv.load(fileName: ".env");

  // Local Storage Service
  await LocalStorageService.init();

  // Supabase initialization
  await SupabaseService.init();

  // Auth State listener
  Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
    final session = data.session;

    await LocalStorageService.setBoolean(
      PrefBoolKey.isLoggedIn,
      session != null,
    );
  });

  runApp(const ProviderScope(child: MyApp()));
}

final themeManager = ThemeManager();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeManager = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Lumio',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,

      themeMode: themeManager.themeMode,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: Colors.pinkAccent,
        scaffoldBackgroundColor: Colors.grey[50],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: Colors.pinkAccent,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
