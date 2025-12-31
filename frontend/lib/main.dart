import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/core/config/app_router.dart';
import 'package:frontend/core/services/local_storage_service.dart';
import 'package:frontend/core/services/supabase/supabase_service.dart';
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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lumio',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.pinkAccent)),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
