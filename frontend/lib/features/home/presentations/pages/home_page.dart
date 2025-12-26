import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/product_search_bar.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
