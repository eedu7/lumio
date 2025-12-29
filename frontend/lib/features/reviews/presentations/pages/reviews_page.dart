import 'package:flutter/material.dart';
import 'package:frontend/features/reviews/presentations/widgets/review_card.dart';
import 'package:frontend/features/reviews/presentations/widgets/review_rating_filter.dart';
import 'package:go_router/go_router.dart';

class ReviewsPage extends StatefulWidget {
  final String productId;

  const ReviewsPage({super.key, required this.productId});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // App Bar
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.grey[50],
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              leadingWidth: 70,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Center(
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16),
                    ),
                  ),
                ),
              ),
              title: Text(
                'Reviews (42)',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Rating Filter (Pinned)
            SliverPersistentHeader(
              pinned: true,
              delegate: _FilterHeaderDelegate(
                child: Container(
                  color: Colors.grey[50],
                  child: const ReviewRatingFilter(),
                ),
              ),
            ),

            const SliverPadding(padding: EdgeInsets.only(top: 12)),

            // Reviews List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ReviewCard(),
                ),
                childCount: 12,
              ),
            ),

            const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
          ],
        ),
      ),
    );
  }
}

class _FilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _FilterHeaderDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
