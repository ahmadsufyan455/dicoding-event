import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const DashboardScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: [
          const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          const NavigationDestination(
            icon: Icon(Icons.upcoming),
            label: 'Upcoming',
          ),
          const NavigationDestination(
            icon: Icon(Icons.event),
            label: 'Finished',
          ),
          const NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(index),
      ),
    );
  }
}
