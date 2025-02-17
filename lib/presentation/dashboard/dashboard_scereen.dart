import 'package:dicoding_event/presentation/favorite/favorite_screen.dart';
import 'package:dicoding_event/presentation/finished/finished_screen.dart';
import 'package:dicoding_event/presentation/home/home_screen.dart';
import 'package:dicoding_event/presentation/upcoming/upcoming_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final pages = [
    const HomeScreen(),
    const UpcomingScreen(),
    const FinishedScreen(),
    const FavoriteScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
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
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => _onTabTapped(index),
      ),
    );
  }
}
