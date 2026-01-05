import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_assets.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/core/services/local_storage_service.dart';
import 'package:frontend/core/services/supabase/supabase_service.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Flawless Makeup',
      'desc':
          'Discover premium makeup essentials that enhance your natural beauty for every occasion.',
      'image': AppAssets.onBoardingImageFirst, // makeup.jpg
    },
    {
      'title': 'Signature Fragrances',
      'desc':
          'Find long-lasting, luxurious fragrances crafted to leave a lasting impression.',
      'image': AppAssets.onBoardingImageSecond, // fragrance.jpg
    },
    {
      'title': 'Radiant Skincare',
      'desc':
          'Nourish and protect your skin with carefully selected skincare products you can trust.',
      'image': AppAssets.onBoardingImageThird, // skin-care.jpg
    },
  ];

  Future<void> _finishOnboarding() async {
    // Save state to Local Storage
    await LocalStorageService.setBoolean(PrefBoolKey.hasSeenOnBoarding, true);

    if (!mounted) return;

    // Route based on Auth
    final session = SupabaseService.client.auth.currentSession;
    if (session != null) {
      context.go(AppRoutes.home);
    } else {
      context.go(AppRoutes.socialLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Top Half: Image
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _onboardingData[index]['image']!,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

              // Bottom Half: Text & Button
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      // Dots Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 8),
                            height: 8,
                            width: _currentPage == index ? 24 : 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.pinkAccent
                                  : Colors.pinkAccent.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        _onboardingData[_currentPage]['title']!,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _onboardingData[_currentPage]['desc']!,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage < 2) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _finishOnboarding();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            _currentPage == 2 ? 'Get Started' : 'Next',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Skip Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 16,
            child: TextButton(
              onPressed: _finishOnboarding,
              style: TextButton.styleFrom(
                backgroundColor: Colors.black.withValues(alpha: 0.4),
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
              ),
              child: const Text('Skip'),
            ),
          ),
        ],
      ),
    );
  }
}
