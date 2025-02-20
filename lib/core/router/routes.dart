import 'package:dicoding_event/core/router/app_routes.dart';
import 'package:dicoding_event/presentation/dashboard/dashboard_scereen.dart';
import 'package:dicoding_event/presentation/detail/detail_screen.dart';
import 'package:dicoding_event/presentation/favorite/favorite_screen.dart';
import 'package:dicoding_event/presentation/finished/finished_screen.dart';
import 'package:dicoding_event/presentation/home/home_screen.dart';
import 'package:dicoding_event/presentation/search/search_screen.dart';
import 'package:dicoding_event/presentation/upcoming/upcoming_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      name: AppRoutes.dashboard,
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      name: AppRoutes.home,
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: AppRoutes.upcoming,
      path: '/upcoming',
      builder: (context, state) => const UpcomingScreen(),
    ),
    GoRoute(
      name: AppRoutes.finished,
      path: '/finished',
      builder: (context, state) => const FinishedScreen(),
    ),
    GoRoute(
      name: AppRoutes.favorite,
      path: '/favorite',
      builder: (context, state) => const FavoriteScreen(),
    ),
    GoRoute(
      name: AppRoutes.search,
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      name: AppRoutes.detail,
      path: '/detail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return DetailScreen(id: id);
      },
    ),
  ],
);
