import 'package:dicoding_event/core/router/app_routes.dart';
import 'package:dicoding_event/presentation/dashboard/dashboard_scereen.dart';
import 'package:dicoding_event/presentation/detail/detail_screen.dart';
import 'package:dicoding_event/presentation/favorite/favorite_screen.dart';
import 'package:dicoding_event/presentation/finished/finished_screen.dart';
import 'package:dicoding_event/presentation/home/home_screen.dart';
import 'package:dicoding_event/presentation/upcoming/upcoming_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.home,
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.upcoming,
              path: '/upcoming',
              builder: (context, state) => const UpcomingScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.finished,
              path: '/finished',
              builder: (context, state) => const FinishedScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.favorite,
              path: '/favorite',
              builder: (context, state) => const FavoriteScreen(),
            ),
          ],
        ),
      ],
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
