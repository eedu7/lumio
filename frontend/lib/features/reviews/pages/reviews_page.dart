import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              leading: context.canPop()
                  ? IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back),
                    )
                  : null,
              title: Text('Reviews (N)', style: theme.textTheme.titleLarge),
            ),

            SliverToBoxAdapter(child: Center(child: Text('Reviews Page'))),
          ],
        ),
      ),
    );
  }
}
