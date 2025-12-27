import 'package:flutter/material.dart';
import 'package:frontend/features/categories/widgets/product_categories.dart';
import 'package:frontend/features/categories/widgets/product_categories_small.dart';
import 'package:frontend/features/home/presentations/widgets/product_search_bar.dart';
import 'package:frontend/features/home/presentations/widgets/section_heading.dart';
import 'package:frontend/features/home/presentations/widgets/special_offers.dart';
import 'package:frontend/features/home/presentations/widgets/user_profile_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            spacing: 24.0,
            children: [
              // User Profile
              UserProfileHeader(username: 'JD', greeting: 'Good Morning! 👋'),

              // Search Bar
              ProductSearchBar(),

              // Special Offers
              Column(
                spacing: 4.0,
                children: [
                  SectionHeading(
                    title: 'Special Offers',
                    actionLabel: 'See All',
                    onPressed: () {},
                  ),
                  SpecialOffers(),
                ],
              ),

              // Categories
              ProductCategories(),

              // Popular Products
              Column(
                spacing: 4.0,
                children: [
                  SectionHeading(
                    title: 'Popular Products',
                    actionLabel: 'See All',
                    onPressed: () {},
                  ),
                  ProductCategoriesSmall(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
