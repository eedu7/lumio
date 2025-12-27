import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatefulWidget {
  final String qKey;
  final String qValue;

  const CategoryPage({super.key, required this.qKey, required this.qValue});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: context.canPop()
            ? IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back),
              )
            : null,
        title: Text(widget.qValue, style: textTheme.titleLarge),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'Category: ${widget.qValue}',
            style: textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
