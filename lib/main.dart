import 'package:dicoding_event/core/router/routes.dart';
import 'package:dicoding_event/core/theme/theme.dart';
import 'package:dicoding_event/presentation/detail/bloc/detail_bloc.dart';
import 'package:dicoding_event/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:dicoding_event/presentation/favorite/cubit/list_favorite_cubit.dart';
import 'package:dicoding_event/presentation/finished/bloc/finished_bloc.dart';
import 'package:dicoding_event/presentation/search/bloc/search_bloc.dart';
import 'package:dicoding_event/presentation/upcoming/bloc/upcoming_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<FinishedBloc>()),
        BlocProvider(create: (_) => getIt<UpcomingBloc>()),
        BlocProvider(create: (_) => getIt<SearchBloc>()),
        BlocProvider(create: (_) => getIt<DetailBloc>()),
        BlocProvider(create: (_) => getIt<FavoriteBloc>()),
        BlocProvider(create: (_) => getIt<ListFavoriteCubit>()),
      ],
      child: const DicodingEventApp(),
    ),
  );
}

class DicodingEventApp extends StatelessWidget {
  const DicodingEventApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Dicoding Event',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
