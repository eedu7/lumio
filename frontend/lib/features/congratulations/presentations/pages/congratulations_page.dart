import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_u4yrau.json',
                    height: 300,
                    repeat: true,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: theme.colorScheme.primary,
                      size: 80,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Text(
                'Congratulations!',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Your order has been placed successfully.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "We'll send you a confirmation email shortly.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.go(AppRoutes.home),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
