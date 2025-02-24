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

import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<FinishedBloc>()),
        BlocProvider(create: (context) => serviceLocator<UpcomingBloc>()),
        BlocProvider(create: (context) => serviceLocator<SearchBloc>()),
        BlocProvider(create: (context) => serviceLocator<DetailBloc>()),
        BlocProvider(create: (context) => serviceLocator<FavoriteBloc>()),
        BlocProvider(create: (context) => serviceLocator<ListFavoriteCubit>()),
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
