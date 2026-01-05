import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/categories/widgets/product_categories.dart';
import 'package:frontend/features/categories/widgets/product_categories_small.dart';
import 'package:frontend/features/home/presentations/widgets/product_catalog.dart';
import 'package:frontend/features/home/presentations/widgets/product_search_bar.dart';
import 'package:frontend/features/home/presentations/widgets/section_heading.dart';
import 'package:frontend/features/home/presentations/widgets/special_offers.dart';
import 'package:frontend/features/home/presentations/widgets/user_profile_header.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfileHeader(username: 'A', greeting: 'Good Morning! 👋'),

              const SizedBox(height: 20),

              ProductSearchBar(),

              const SizedBox(height: 24),

              SectionHeading(
                title: 'Special Offers',
                actionLabel: 'See All',
                onPressed: () => context.push(AppRoutes.specialOffers),
              ),
              const SizedBox(height: 12),
              SpecialOffers(),

              const SizedBox(height: 24),

              ProductCategories(),

              const SizedBox(height: 24),

              SectionHeading(
                title: 'Popular Products',
                actionLabel: 'See All',
                onPressed: () =>
                    context.push(
                      AppRoutes.categoryProducts(
                        key: AppRoutes.collection,
                        value: 'Popular Products',
                      ),
                    ),
              ),
              const SizedBox(height: 16),
              ProductCategoriesSmall(),

              const SizedBox(height: 24),
              ProductCatalog(),
            ],
          ),
        ),
      ),
    );
  }
}
