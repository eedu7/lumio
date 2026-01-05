import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/services/local_storage_service.dart';
import 'package:frontend/core/services/supabase/supabase_service.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    // Wait for animation and simulation of loading
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    // 1. Check if user has seen onboarding
    final bool hasSeenOnboarding = LocalStorageService.getBool(
      PrefBoolKey.hasSeenOnBoarding,
    );

    if (!hasSeenOnboarding) {
      context.go(AppRoutes.onboarding);
      return;
    }

    // 2. Check Supabase Auth State
    final session = SupabaseService.client.auth.currentSession;
    if (session != null) {
      context.go(AppRoutes.home);
    } else {
      context.go(AppRoutes.socialLogin);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shield_rounded,
                size: 100,
                color: Colors.pinkAccent,
              ),
              const SizedBox(height: 20),
              Text(
                'VALOUR',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 50),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
