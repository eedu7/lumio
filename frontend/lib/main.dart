import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/core/config/app_router.dart';
import 'package:frontend/core/services/supabase/supabase_service.dart';

Future<void> main() async {
  // Loading environment
  await dotenv.load(fileName: ".env");

  // Supabase initialization
  await SupabaseService.init();

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
