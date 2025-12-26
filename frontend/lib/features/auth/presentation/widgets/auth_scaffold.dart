import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthScaffold extends StatelessWidget {
  final Widget body;
  final String helperText;
  final String actionText;
  final String actionRoute;

  const AuthScaffold({
    super.key,
    required this.body,
    required this.helperText,
    required this.actionRoute,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: context.canPop()
            ? IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              )
            : null,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                // Constrain the column to at least the height of the screen
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        // The main content area
                        Expanded(child: body),

                        // The Footer area
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                helperText,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(width: 4),
                              // Replaces 'spacing' for compatibility
                              GestureDetector(
                                onTap: () => context.push(actionRoute),
                                child: Text(
                                  actionText,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
