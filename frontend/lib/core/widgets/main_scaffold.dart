import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: NavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          indicatorColor: theme.primaryColor.withValues(alpha: 0.1),
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (int index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          height: 70,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.grey[600]),
              selectedIcon: Icon(Icons.home_rounded, color: theme.primaryColor),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined, color: Colors.grey[600]),
              selectedIcon: Icon(
                Icons.shopping_bag_rounded,
                color: theme.primaryColor,
              ),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.smart_toy_outlined, color: Colors.grey[600]),
              selectedIcon: Icon(Icons.smart_toy, color: theme.primaryColor),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_awesome, color: Colors.grey[600]),
              selectedIcon: Icon(
                Icons.auto_awesome_outlined,
                color: theme.primaryColor,
              ),
              label: 'SF',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded, color: Colors.grey[600]),
              selectedIcon: Icon(
                Icons.person_rounded,
                color: theme.primaryColor,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
